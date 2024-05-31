import 'package:egrocer/helper/utils/generalImports.dart';

class WalletPaymentMethods extends StatelessWidget {
  final PaymentMethodsData? paymentMethodsData;
  final TextEditingController rechargeAmount;

  const WalletPaymentMethods({
    super.key,
    this.paymentMethodsData,
    required this.rechargeAmount,
  });

  @override
  Widget build(BuildContext context) {
    if (paymentMethodsData?.razorpayPaymentMethod == "1") {
      context.read<WalletRechargeProvider>().updateWalletPaymentMethodsCount();
    }
    if (paymentMethodsData?.paystackPaymentMethod == "1") {
      context.read<WalletRechargeProvider>().updateWalletPaymentMethodsCount();
    }
    if (paymentMethodsData?.stripePaymentMethod == "1") {
      context.read<WalletRechargeProvider>().updateWalletPaymentMethodsCount();
    }
    if (paymentMethodsData?.paytmPaymentMethod == "1") {
      context.read<WalletRechargeProvider>().updateWalletPaymentMethodsCount();
    }
    if (paymentMethodsData?.paypalPaymentMethod == "1") {
      context.read<WalletRechargeProvider>().updateWalletPaymentMethodsCount();
    }

    return paymentMethodsData != null
        ? context.watch<WalletRechargeProvider>().availablePaymentMethods == 0
            ? Container()
            : Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextLabel(
                    jsonKey: "payment_method",
                    style: TextStyle(
                      color: ColorsRes.mainTextColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                  if (paymentMethodsData?.razorpayPaymentMethod == "1")
                    GestureDetector(
                      onTap: () {
                        if (!context
                            .read<WalletRechargeProvider>()
                            .isPaymentUnderProcessing) {
                          context
                              .read<WalletRechargeProvider>()
                              .setSelectedWalletPaymentMethod("Razorpay");
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.zero,
                        margin: EdgeInsets.symmetric(vertical: Constant.size5),
                        decoration: BoxDecoration(
                          color: context
                                      .read<WalletRechargeProvider>()
                                      .selectedPaymentMethod ==
                                  "Razorpay"
                              ? Theme.of(context).cardColor
                              : Theme.of(context).scaffoldBackgroundColor,
                          borderRadius: Constant.borderRadius7,
                          border: Border.all(
                            width: context
                                        .read<WalletRechargeProvider>()
                                        .selectedPaymentMethod ==
                                    "Razorpay"
                                ? 1
                                : 0.3,
                            color: context
                                        .read<WalletRechargeProvider>()
                                        .selectedPaymentMethod ==
                                    "Razorpay"
                                ? ColorsRes.appColor
                                : ColorsRes.grey,
                          ),
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.only(
                                  start: Constant.size10),
                              child: defaultImg(
                                  image: "ic_razorpay", width: 25, height: 25),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.only(
                                  start: Constant.size10),
                              child: Text(
                                getTranslatedValue(
                                  context,
                                  "razorpay",
                                ),
                                style: TextStyle(
                                  fontSize: 12,
                                  color: ColorsRes.mainTextColor,
                                ),
                              ),
                            ),
                            const Spacer(),
                            CustomRadio(
                              inactiveColor: ColorsRes.mainTextColor,
                              value: "Razorpay",
                              groupValue: context
                                  .read<WalletRechargeProvider>()
                                  .selectedPaymentMethod,
                              activeColor: ColorsRes.appColor,
                              onChanged: (value) {
                                if (!context
                                    .read<WalletRechargeProvider>()
                                    .isPaymentUnderProcessing) {
                                  context
                                      .read<WalletRechargeProvider>()
                                      .setSelectedWalletPaymentMethod(
                                          "Razorpay");
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  if (paymentMethodsData?.paystackPaymentMethod == "1")
                    GestureDetector(
                      onTap: () {
                        if (!context
                            .read<WalletRechargeProvider>()
                            .isPaymentUnderProcessing) {
                          context
                              .read<WalletRechargeProvider>()
                              .setSelectedWalletPaymentMethod("Paystack");
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.zero,
                        margin: EdgeInsets.symmetric(vertical: Constant.size5),
                        decoration: BoxDecoration(
                          color: context
                                      .read<WalletRechargeProvider>()
                                      .selectedPaymentMethod ==
                                  "Paystack"
                              ? Theme.of(context).cardColor
                              : Theme.of(context).scaffoldBackgroundColor,
                          borderRadius: Constant.borderRadius7,
                          border: Border.all(
                            width: context
                                        .read<WalletRechargeProvider>()
                                        .selectedPaymentMethod ==
                                    "Paystack"
                                ? 1
                                : 0.3,
                            color: context
                                        .read<WalletRechargeProvider>()
                                        .selectedPaymentMethod ==
                                    "Paystack"
                                ? ColorsRes.appColor
                                : ColorsRes.grey,
                          ),
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.only(
                                  start: Constant.size10),
                              child: defaultImg(
                                  image: "ic_paystack", width: 25, height: 25),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.only(
                                  start: Constant.size10),
                              child: Text(
                                getTranslatedValue(
                                  context,
                                  "paystack",
                                ),
                                style: TextStyle(
                                  fontSize: 12,
                                  color: ColorsRes.mainTextColor,
                                ),
                              ),
                            ),
                            const Spacer(),
                            CustomRadio(
                              inactiveColor: ColorsRes.mainTextColor,
                              value: "Paystack",
                              groupValue: context
                                  .read<WalletRechargeProvider>()
                                  .selectedPaymentMethod,
                              activeColor: ColorsRes.appColor,
                              onChanged: (value) {
                                if (!context
                                    .read<WalletRechargeProvider>()
                                    .isPaymentUnderProcessing) {
                                  context
                                      .read<WalletRechargeProvider>()
                                      .setSelectedWalletPaymentMethod(
                                          "Paystack");
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  if (paymentMethodsData?.stripePaymentMethod == "1")
                    GestureDetector(
                      onTap: () {
                        if (!context
                            .read<WalletRechargeProvider>()
                            .isPaymentUnderProcessing) {
                          context
                              .read<WalletRechargeProvider>()
                              .setSelectedWalletPaymentMethod("Stripe");
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.zero,
                        margin: EdgeInsets.symmetric(vertical: Constant.size5),
                        decoration: BoxDecoration(
                          color: context
                                      .read<WalletRechargeProvider>()
                                      .selectedPaymentMethod ==
                                  "Stripe"
                              ? Theme.of(context).cardColor
                              : Theme.of(context).scaffoldBackgroundColor,
                          borderRadius: Constant.borderRadius7,
                          border: Border.all(
                            width: context
                                        .read<WalletRechargeProvider>()
                                        .selectedPaymentMethod ==
                                    "Stripe"
                                ? 1
                                : 0.3,
                            color: context
                                        .read<WalletRechargeProvider>()
                                        .selectedPaymentMethod ==
                                    "Stripe"
                                ? ColorsRes.appColor
                                : ColorsRes.grey,
                          ),
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.only(
                                  start: Constant.size10),
                              child: defaultImg(
                                  image: "ic_stripe",
                                  width: 25,
                                  height: 25,
                                  iconColor: ColorsRes.mainTextColor),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.only(
                                  start: Constant.size10),
                              child: Text(
                                getTranslatedValue(
                                  context,
                                  "stripe",
                                ),
                                style: TextStyle(
                                  fontSize: 12,
                                  color: ColorsRes.mainTextColor,
                                ),
                              ),
                            ),
                            const Spacer(),
                            CustomRadio(
                              inactiveColor: ColorsRes.mainTextColor,
                              value: "Stripe",
                              groupValue: context
                                  .read<WalletRechargeProvider>()
                                  .selectedPaymentMethod,
                              activeColor: ColorsRes.appColor,
                              onChanged: (value) {
                                if (!context
                                    .read<WalletRechargeProvider>()
                                    .isPaymentUnderProcessing) {
                                  context
                                      .read<WalletRechargeProvider>()
                                      .setSelectedWalletPaymentMethod("Stripe");
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  if (paymentMethodsData?.paytmPaymentMethod == "1")
                    GestureDetector(
                      onTap: () {
                        if (!context
                            .read<WalletRechargeProvider>()
                            .isPaymentUnderProcessing) {
                          context
                              .read<WalletRechargeProvider>()
                              .setSelectedWalletPaymentMethod("Paytm");
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.zero,
                        margin: EdgeInsets.symmetric(vertical: Constant.size5),
                        decoration: BoxDecoration(
                          color: context
                                      .read<WalletRechargeProvider>()
                                      .selectedPaymentMethod ==
                                  "Paytm"
                              ? Theme.of(context).cardColor
                              : Theme.of(context).scaffoldBackgroundColor,
                          borderRadius: Constant.borderRadius7,
                          border: Border.all(
                            width: context
                                        .read<WalletRechargeProvider>()
                                        .selectedPaymentMethod ==
                                    "Paytm"
                                ? 1
                                : 0.3,
                            color: context
                                        .read<WalletRechargeProvider>()
                                        .selectedPaymentMethod ==
                                    "Paytm"
                                ? ColorsRes.appColor
                                : ColorsRes.grey,
                          ),
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.only(
                                  start: Constant.size10),
                              child: defaultImg(
                                  image: "ic_paytm", width: 25, height: 25),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.only(
                                  start: Constant.size10),
                              child: Text(
                                getTranslatedValue(
                                  context,
                                  "Paytm",
                                ),
                                style: TextStyle(
                                  fontSize: 12,
                                  color: ColorsRes.mainTextColor,
                                ),
                              ),
                            ),
                            const Spacer(),
                            CustomRadio(
                              inactiveColor: ColorsRes.mainTextColor,
                              value: "Paytm",
                              groupValue: context
                                  .read<WalletRechargeProvider>()
                                  .selectedPaymentMethod,
                              activeColor: ColorsRes.appColor,
                              onChanged: (value) {
                                if (!context
                                    .read<WalletRechargeProvider>()
                                    .isPaymentUnderProcessing) {
                                  context
                                      .read<WalletRechargeProvider>()
                                      .setSelectedWalletPaymentMethod("Paytm");
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  if (paymentMethodsData?.paypalPaymentMethod == "1")
                    GestureDetector(
                      onTap: () {
                        if (!context
                            .read<WalletRechargeProvider>()
                            .isPaymentUnderProcessing) {
                          context
                              .read<WalletRechargeProvider>()
                              .setSelectedWalletPaymentMethod("Paypal");
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.zero,
                        margin: EdgeInsets.symmetric(vertical: Constant.size5),
                        decoration: BoxDecoration(
                          color: context
                                      .read<WalletRechargeProvider>()
                                      .selectedPaymentMethod ==
                                  "Paypal"
                              ? Theme.of(context).cardColor
                              : Theme.of(context).scaffoldBackgroundColor,
                          borderRadius: Constant.borderRadius7,
                          border: Border.all(
                            width: context
                                        .read<WalletRechargeProvider>()
                                        .selectedPaymentMethod ==
                                    "Paypal"
                                ? 1
                                : 0.3,
                            color: context
                                        .read<WalletRechargeProvider>()
                                        .selectedPaymentMethod ==
                                    "Paypal"
                                ? ColorsRes.appColor
                                : ColorsRes.grey,
                          ),
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.only(
                                  start: Constant.size10),
                              child: defaultImg(
                                  image: "ic_paypal", width: 25, height: 25),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.only(
                                  start: Constant.size10),
                              child: Text(
                                getTranslatedValue(
                                  context,
                                  "paypal",
                                ),
                                style: TextStyle(
                                  fontSize: 12,
                                  color: ColorsRes.mainTextColor,
                                ),
                              ),
                            ),
                            const Spacer(),
                            CustomRadio(
                              inactiveColor: ColorsRes.mainTextColor,
                              value: "Paypal",
                              groupValue: context
                                  .read<WalletRechargeProvider>()
                                  .selectedPaymentMethod,
                              activeColor: ColorsRes.appColor,
                              onChanged: (value) {
                                if (!context
                                    .read<WalletRechargeProvider>()
                                    .isPaymentUnderProcessing) {
                                  context
                                      .read<WalletRechargeProvider>()
                                      .setSelectedWalletPaymentMethod("Paypal");
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              )
        : const SizedBox.shrink();
  }
}
