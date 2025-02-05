import 'package:egrocer/helper/utils/generalImports.dart';

class ReturnOrderDialog extends StatelessWidget {
  final Order order;
  final String orderItemId;

  const ReturnOrderDialog({
    required this.order,
    required this.orderItemId,
    Key? key,
  }) : super(key: key);

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
          jsonKey: "sure_to_return_order",
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
                    Navigator.of(context).pop();
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
                            status: Constant.orderStatusCode[7],
                            context: context,
                            reason: textFieldReasonController.text,
                          )
                          .then((value) {
                        Navigator.pop(context, value);
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
