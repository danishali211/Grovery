import 'package:egrocer/helper/utils/generalImports.dart';

class CancelProductDialog extends StatelessWidget {
  final Order order;
  final String orderItemId;

  CancelProductDialog(
      {Key? key, required this.order, required this.orderItemId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController textFieldReasonController = TextEditingController();
    return WillPopScope(
      onWillPop: () {
        if (context.read<UpdateOrderStatusProvider>().getUpdateOrderStatus() ==
            UpdateOrderStatus.inProgress) {
          return Future.value(false);
        }
        return Future.value(true);
      },
      child: AlertDialog(
        surfaceTintColor: Colors.transparent,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: CustomTextLabel(
          jsonKey: "sure_to_cancel_product",
        ),
        content: TextField(
          controller: textFieldReasonController,
          autofocus: true,
          focusNode: FocusNode(),
          decoration: InputDecoration(
            isDense: true,
            border: OutlineInputBorder(
              borderSide: BorderSide(color: ColorsRes.subTitleMainTextColor),
              borderRadius: BorderRadius.circular(10),
            ),
            hintText: getTranslatedValue(context, "enter_reason"),
            hintStyle: TextStyle(
              color: ColorsRes.subTitleMainTextColor,
            ),
          ),
          style: TextStyle(
            color: ColorsRes.mainTextColor,
          ),
        ),
        actions: [
          Consumer<UpdateOrderStatusProvider>(builder: (context, provider, _) {
            if (provider.getUpdateOrderStatus() ==
                UpdateOrderStatus.inProgress) {
              return const Center(
                child: CustomCircularProgressIndicator(),
              );
            }
            return Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                  child: CustomTextLabel(
                    jsonKey: "no",
                    style: TextStyle(color: ColorsRes.mainTextColor),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    if (textFieldReasonController.text.isNotEmpty) {
                      context
                          .read<UpdateOrderStatusProvider>()
                          .updateStatus(
                            order: order,
                            orderItemId: orderItemId,
                            status: Constant.orderStatusCode[6],
                            context: context,
                            reason: textFieldReasonController.text,
                          )
                          .then((value) {
                        Navigator.pop(context, value);
                        context
                            .read<UserProfileProvider>()
                            .loginApi(context: context, params: {
                          ApiAndParams.mobile:
                              Constant.session.getData(SessionManager.keyPhone),
                          // ApiAndParams.authUid: "123456",
                          // Temp used for testing
                          ApiAndParams.authUid: Constant.session
                              .getData(SessionManager.keyAuthUid),
                          // In live this will use
                        });
                      });
                    } else {
                      GeneralMethods.showMessage(
                          context,
                          getTranslatedValue(context, "reason_required"),
                          MessageType.warning);
                    }
                  },
                  child: CustomTextLabel(
                    jsonKey: "yes",
                    style: TextStyle(color: ColorsRes.appColor),
                  ),
                ),
              ],
            );
          }),
        ],
      ),
    );
  }
}
