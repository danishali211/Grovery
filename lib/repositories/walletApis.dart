import 'package:egrocer/helper/utils/generalImports.dart';

Future<Map<String, dynamic>> getWalletHistoryApi(
    {required BuildContext context,
    required Map<String, dynamic> params}) async {
  params[ApiAndParams.type] = ApiAndParams.walletType;

  var response = await GeneralMethods.sendApiRequest(
      apiName: ApiAndParams.apiTransaction,
      params: params,
      isPost: false,
      context: context);
  return json.decode(response);
}

Future<Map<String, dynamic>> initialTransactionForWalletRecharge(
    {required BuildContext context,
    required Map<String, dynamic> params}) async {
  params[ApiAndParams.type] = ApiAndParams.walletType;

  var response = await GeneralMethods.sendApiRequest(
      apiName: ApiAndParams.apiInitiateTransaction,
      params: params,
      isPost: false,
      context: context);
  return json.decode(response);
}
