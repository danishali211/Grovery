import 'package:egrocer/helper/utils/generalImports.dart';

enum WalletRechargeProviderPaymentMethodsState {
  paymentMethodInitial,
  paymentMethodLoading,
  paymentMethodLoaded,
  paymentMethodError,
}

class WalletRechargeProvider extends ChangeNotifier {
  WalletRechargeProviderPaymentMethodsState
      walletRechargeProviderPaymentMethodsState =
      WalletRechargeProviderPaymentMethodsState.paymentMethodInitial;

  String message = "";

  bool isPaymentUnderProcessing = false;

  //Payment methods variables
  String selectedPaymentMethod = "";
  PaymentMethods? paymentMethods;
  PaymentMethodsData? paymentMethodsData;

  //Place order variables
  String placedOrderId = "";
  String razorpayOrderId = "";
  String transactionId = "";
  String payStackReference = "";

  String paytmTxnToken = "";

  int availablePaymentMethods = 0;

  Future setWalletPaymentProcessState(bool value) async {
    isPaymentUnderProcessing = value;
    notifyListeners();
  }

  Future updateWalletPaymentMethodsCount() async {
    availablePaymentMethods++;
  }

  Future resetWalletPaymentMethodsCount() async {
    availablePaymentMethods = 0;
  }

  Future getWalletPaymentMethods({required BuildContext context}) async {
    walletRechargeProviderPaymentMethodsState =
        WalletRechargeProviderPaymentMethodsState.paymentMethodLoading;
    notifyListeners();
    try {
      Map<String, dynamic> getPaymentMethodsSettings =
          (await getPaymentMethodsSettingsApi(context: context, params: {}));

      if (getPaymentMethodsSettings[ApiAndParams.status].toString() == "1") {
        List<int> decodedBytes = base64
            .decode(getPaymentMethodsSettings[ApiAndParams.data].toString());
        String decodedString = utf8.decode(decodedBytes);
        Map<String, dynamic> map = json.decode(decodedString);
        getPaymentMethodsSettings[ApiAndParams.data] = map;

        paymentMethods = PaymentMethods.fromJson(getPaymentMethodsSettings);
        paymentMethodsData = paymentMethods?.data;

        if (paymentMethodsData?.razorpayPaymentMethod == "1") {
          selectedPaymentMethod = "Razorpay";
        } else if (paymentMethodsData?.paystackPaymentMethod == "1") {
          selectedPaymentMethod = "Paystack";
        } else if (paymentMethodsData?.stripePaymentMethod == "1") {
          selectedPaymentMethod = "Stripe";
        } else if (paymentMethodsData?.paytmPaymentMethod == "1") {
          selectedPaymentMethod = "Paytm";
        } else if (paymentMethodsData?.paypalPaymentMethod == "1") {
          selectedPaymentMethod = "Paypal";
        }

        walletRechargeProviderPaymentMethodsState =
            WalletRechargeProviderPaymentMethodsState.paymentMethodLoaded;
        notifyListeners();
      } else {
        GeneralMethods.showMessage(
          context,
          message,
          MessageType.warning,
        );
        walletRechargeProviderPaymentMethodsState =
            WalletRechargeProviderPaymentMethodsState.paymentMethodError;
        notifyListeners();
      }
    } catch (e) {
      message = e.toString();
      GeneralMethods.showMessage(
        context,
        message,
        MessageType.warning,
      );
      walletRechargeProviderPaymentMethodsState =
          WalletRechargeProviderPaymentMethodsState.paymentMethodError;
      notifyListeners();
    }
  }

  Future setSelectedWalletPaymentMethod(String method) async {
    selectedPaymentMethod = method;
    notifyListeners();
  }

  Future initiateWalletPaytmTransaction(
      {required BuildContext context, required String rechargeAmount}) async {
    try {
      Map<String, String> params = {};

      params[ApiAndParams.walletAmount] = rechargeAmount;
      params[ApiAndParams.type] = ApiAndParams.walletType;

      Map<String, dynamic> getPaytmTransactionTokenResponse =
          (await getPaytmTransactionTokenApi(context: context, params: params));

      if (getPaytmTransactionTokenResponse[ApiAndParams.status].toString() ==
          "1") {
        PaytmTransactionToken paytmTransactionToken =
            PaytmTransactionToken.fromJson(getPaytmTransactionTokenResponse);
        paytmTxnToken = paytmTransactionToken.data?.txnToken ?? "";
        notifyListeners();
      } else {
        GeneralMethods.showMessage(
          context,
          message,
          MessageType.warning,
        );
        notifyListeners();
        return false;
      }
    } catch (e) {
      message = e.toString();
      GeneralMethods.showMessage(
        context,
        message,
        MessageType.warning,
      );
      notifyListeners();
      return false;
    }
  }

  Future initiateWalletRazorpayTransaction(
      {required BuildContext context, required String rechargeAmount}) async {
    try {
      Map<String, String> params = {};

      params[ApiAndParams.paymentMethod] = selectedPaymentMethod.toString();
      params[ApiAndParams.walletAmount] = rechargeAmount;
      params[ApiAndParams.type] = ApiAndParams.walletType;

      Map<String, dynamic> getInitiatedTransactionResponse =
          (await getInitiatedTransactionApi(context: context, params: params));

      if (getInitiatedTransactionResponse[ApiAndParams.status].toString() ==
          "1") {
        InitiateTransaction initiateTransaction =
            InitiateTransaction.fromJson(getInitiatedTransactionResponse);
        razorpayOrderId = initiateTransaction.data.transactionId;
        notifyListeners();
      } else {
        GeneralMethods.showMessage(
          context,
          getInitiatedTransactionResponse["message"],
          MessageType.warning,
        );
        notifyListeners();
      }
    } catch (e) {
      message = e.toString();
      GeneralMethods.showMessage(
        context,
        message,
        MessageType.warning,
      );
      notifyListeners();
    }
  }

  Future initiateWalletPaypalTransaction(
      {required BuildContext context, required String rechargeAmount}) async {
    try {
      Map<String, String> params = {};

      params[ApiAndParams.paymentMethod] = selectedPaymentMethod.toString();
      params[ApiAndParams.walletAmount] = rechargeAmount;
      params[ApiAndParams.type] = ApiAndParams.walletType;

      Map<String, dynamic> getInitiatedTransactionResponse =
          await getInitiatedTransactionApi(context: context, params: params);

      if (getInitiatedTransactionResponse[ApiAndParams.status].toString() ==
          "1") {
        Map<String, dynamic> data =
            getInitiatedTransactionResponse[ApiAndParams.data];
        Navigator.pushNamed(context, paypalPaymentScreen,
                arguments: data["paypal_redirect_url"])
            .then((value) {
          if (value == "success" || value == "pending") {
            if (value == "pending") {
              GeneralMethods.showMessage(
                  context,
                  getTranslatedValue(
                      context, "wallet_recharge_paypal_pending_message"),
                  MessageType.warning);
            }
            Navigator.pop(context);
            return true;
          } else if (value == "fail") {
            GeneralMethods.showMessage(
              context,
              getTranslatedValue(context, "payment_cancelled_by_user"),
              MessageType.warning,
            );
            return false;
          }
        });
        notifyListeners();
      } else {
        GeneralMethods.showMessage(
          context,
          message,
          MessageType.warning,
        );
        notifyListeners();
        return false;
      }
    } catch (e) {
      message = e.toString();
      GeneralMethods.showMessage(
        context,
        message,
        MessageType.warning,
      );
      notifyListeners();
      return false;
    }
  }

  Future addWalletTransaction(
      {required BuildContext context,
      required String walletRechargeAmount}) async {
    try {
      PackageInfo packageInfo;
      packageInfo = await PackageInfo.fromPlatform();

      Map<String, String> params = {};

      params[ApiAndParams.walletAmount] = walletRechargeAmount;
      params[ApiAndParams.deviceType] =
          GeneralMethods.setFirstLetterUppercase(Platform.operatingSystem);
      params[ApiAndParams.appVersion] = packageInfo.version;
      params[ApiAndParams.transactionId] = transactionId;
      params[ApiAndParams.paymentMethod] = selectedPaymentMethod.toString();
      params[ApiAndParams.type] = ApiAndParams.walletType;

      Map<String, dynamic> addedTransaction =
          (await getAddTransactionApi(context: context, params: params));
      if (addedTransaction[ApiAndParams.status].toString() == "1") {
        Map<String, dynamic> transactionData =
            addedTransaction[ApiAndParams.data];

        Constant.session.setData(SessionManager.keyWalletBalance,
            transactionData[ApiAndParams.userBalance].toString(), true);

        isPaymentUnderProcessing = false;
        notifyListeners();
        Navigator.pop(context, true);
      } else {
        GeneralMethods.showMessage(
          context,
          addedTransaction[ApiAndParams.message],
          MessageType.warning,
        );
        isPaymentUnderProcessing = false;
        notifyListeners();
      }
    } catch (e) {
      message = e.toString();
      GeneralMethods.showMessage(
        context,
        message,
        MessageType.warning,
      );
      isPaymentUnderProcessing = false;
      notifyListeners();
    }
  }
}
