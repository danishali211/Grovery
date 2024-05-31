import 'package:egrocer/helper/utils/generalImports.dart';
import 'package:egrocer/screens/walletRechargeScreen/widget/paymentMethodWidget.dart';
import 'package:egrocer/screens/walletRechargeScreen/widget/walletRechargeButtonWidget.dart';

class WalletRechargeScreen extends StatefulWidget {
  const WalletRechargeScreen({super.key});

  @override
  State<WalletRechargeScreen> createState() => _WalletRechargeScreenState();
}

class _WalletRechargeScreenState extends State<WalletRechargeScreen> {
  TextEditingController rechargeAmount = TextEditingController();

  @override
  void initState() {
    Future.delayed(Duration.zero).then((value) {
      context
          .read<WalletRechargeProvider>()
          .getWalletPaymentMethods(context: context)
          .then((value) {
        StripeService.secret = context
                .read<WalletRechargeProvider>()
                .paymentMethods
                ?.data
                .stripeSecretKey ??
            "";
        StripeService.init(
            context
                    .read<WalletRechargeProvider>()
                    .paymentMethods
                    ?.data
                    .stripePublicKey ??
                "",
            "");
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: getAppBar(
        context: context,
        title: CustomTextLabel(
          jsonKey: "wallet_recharge",
          style: TextStyle(color: ColorsRes.mainTextColor),
        ),
      ),
      body: Consumer<WalletRechargeProvider>(
          builder: (context, walletRechargeProvider, _) {
        if (walletRechargeProvider.walletRechargeProviderPaymentMethodsState ==
            WalletRechargeProviderPaymentMethodsState.paymentMethodLoading) {
          return ListView(
            shrinkWrap: true,
            children: [
              CustomShimmer(
                width: context.width,
                height: 60,
                margin: EdgeInsetsDirectional.only(start: 10, end: 10, top: 10),
              ),
              getSizedBox(height: 10),
              CustomShimmer(
                width: context.width * 0.4,
                height: 30,
                margin: EdgeInsetsDirectional.only(start: 10, end: 10, top: 10),
              ),
              CustomShimmer(
                width: context.width,
                height: 50,
                margin: EdgeInsetsDirectional.only(start: 10, end: 10, top: 10),
              ),
              CustomShimmer(
                width: context.width,
                height: 50,
                margin: EdgeInsetsDirectional.only(start: 10, end: 10, top: 10),
              ),
              CustomShimmer(
                width: context.width,
                height: 50,
                margin: EdgeInsetsDirectional.only(start: 10, end: 10, top: 10),
              ),
              CustomShimmer(
                width: context.width,
                height: 50,
                margin: EdgeInsetsDirectional.only(start: 10, end: 10, top: 10),
              ),
              CustomShimmer(
                width: context.width,
                height: 50,
                margin: EdgeInsetsDirectional.only(start: 10, end: 10, top: 10),
              ),
              getSizedBox(height: 10),
              CustomShimmer(
                width: context.width,
                height: 50,
                margin: EdgeInsetsDirectional.only(start: 10, end: 10, top: 10),
              ),
            ],
          );
        } else {
          return Padding(
            padding: EdgeInsetsDirectional.all(10),
            child: ListView(
              shrinkWrap: true,
              children: [
                editBoxWidget(
                  context,
                  rechargeAmount,
                  GeneralMethods.amountValidation,
                  getTranslatedValue(context, "recharge_amount"),
                  getTranslatedValue(context, "enter_valid_amount"),
                  TextInputType.numberWithOptions(decimal: true),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d*')),
                  ],
                ),
                getSizedBox(height: 20),
                WalletPaymentMethods(
                  paymentMethodsData: context
                      .watch<WalletRechargeProvider>()
                      .paymentMethodsData,
                  rechargeAmount: rechargeAmount,
                ),
                getSizedBox(height: 20),
                WalletRechargeButtonWidget(
                  context: context,
                  rechargeAmount: rechargeAmount,
                )
              ],
            ),
          );
        }
      }),
    );
  }
}
