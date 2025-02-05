import 'package:egrocer/helper/utils/generalImports.dart';

Future getCountryApi(
    {required BuildContext context,
    required Map<String, String> params}) async {
  try {
    var response = await GeneralMethods.sendApiRequest(
        apiName: ApiAndParams.apiCountries,
        params: params,
        isPost: false,
        context: context);
    return json.decode(response);
  } catch (e) {
    rethrow;
  }
}
