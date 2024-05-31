import 'package:egrocer/helper/utils/generalImports.dart';

getPaymentMethods(
    PaymentMethodsData? paymentMethodsData, BuildContext context) {
  context.read<CheckoutProvider>().resetPaymentMethodsCount();
  if (paymentMethodsData?.codPaymentMethod == "1" &&
      context.read<CheckoutProvider>().isCodAllowed == true) {
    context.read<CheckoutProvider>().updatePaymentMethodsCount();
  }
  if (paymentMethodsData?.razorpayPaymentMethod == "1") {
    context.read<CheckoutProvider>().updatePaymentMethodsCount();
  }
  if (paymentMethodsData?.paystackPaymentMethod == "1") {
    context.read<CheckoutProvider>().updatePaymentMethodsCount();
  }
  if (paymentMethodsData?.stripePaymentMethod == "1") {
    context.read<CheckoutProvider>().updatePaymentMethodsCount();
  }
  if (paymentMethodsData?.paytmPaymentMethod == "1") {
    context.read<CheckoutProvider>().updatePaymentMethodsCount();
  }
  if (paymentMethodsData?.paypalPaymentMethod == "1") {
    context.read<CheckoutProvider>().updatePaymentMethodsCount();
  }

  return paymentMethodsData != null
      ? context.watch<CheckoutProvider>().availablePaymentMethods == 0
          ? Container()
          : Container(
              decoration:
                  DesignConfig.boxDecoration(Theme.of(context).cardColor, 10),
              padding: const EdgeInsets.all(10),
              margin: EdgeInsetsDirectional.only(
                start: 10,
                end: 10,
                bottom: 10,
              ),
              child: Padding(
                padding: EdgeInsets.all(Constant.size10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      getTranslatedValue(
                        context,
                        "payment_method",
                      ),
                      softWrap: true,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: ColorsRes.mainTextColor,
                      ),
                    ),
                    getSizedBox(
                      height: Constant.size5,
                    ),
                    getSizedBox(
                      height: Constant.size5,
                    ),
                    Column(
                      children: [
                        if (paymentMethodsData.codPaymentMethod == "1" &&
                            context.read<CheckoutProvider>().isCodAllowed ==
                                true)
                          GestureDetector(
                            onTap: () {
                              if (!context
                                  .read<CheckoutProvider>()
                                  .isPaymentUnderProcessing) {
                                context
                                    .read<CheckoutProvider>()
                                    .setSelectedPaymentMethod("COD");
                              }
                            },
                            child: Container(
                              padding: EdgeInsets.zero,
                              margin: EdgeInsets.symmetric(
                                  vertical: Constant.size5),
                              decoration: BoxDecoration(
                                color: context
                                            .read<CheckoutProvider>()
                                            .selectedPaymentMethod ==
                                        "COD"
                                    ? Theme.of(context).cardColor
                                    : Theme.of(context).scaffoldBackgroundColor,
                                borderRadius: Constant.borderRadius7,
                                border: Border.all(
                                  width: context
                                              .read<CheckoutProvider>()
                                              .selectedPaymentMethod ==
                                          "COD"
                                      ? 1
                                      : 0.3,
                                  color: context
                                              .read<CheckoutProvider>()
                                              .selectedPaymentMethod ==
                                          "COD"
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
                                        image: "ic_cod", width: 25, height: 25),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.only(
                                        start: Constant.size10),
                                    child: Text(
                                      getTranslatedValue(
                                        context,
                                        "cash_on_delivery",
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
                                    value: "COD",
                                    groupValue: context
                                        .read<CheckoutProvider>()
                                        .selectedPaymentMethod,
                                    activeColor: ColorsRes.appColor,
                                    onChanged: (value) {
                                      if (!context
                                          .read<CheckoutProvider>()
                                          .isPaymentUnderProcessing) {
                                        context
                                            .read<CheckoutProvider>()
                                            .setSelectedPaymentMethod("COD");
                                      }
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        if (paymentMethodsData.razorpayPaymentMethod == "1")
                          GestureDetector(
                            onTap: () {
                              if (!context
                                  .read<CheckoutProvider>()
                                  .isPaymentUnderProcessing) {
                                context
                                    .read<CheckoutProvider>()
                                    .setSelectedPaymentMethod("Razorpay");
                              }
                            },
                            child: Container(
                              padding: EdgeInsets.zero,
                              margin: EdgeInsets.symmetric(
                                  vertical: Constant.size5),
                              decoration: BoxDecoration(
                                color: context
                                            .read<CheckoutProvider>()
                                            .selectedPaymentMethod ==
                                        "Razorpay"
                                    ? Theme.of(context).cardColor
                                    : Theme.of(context).scaffoldBackgroundColor,
                                borderRadius: Constant.borderRadius7,
                                border: Border.all(
                                  width: context
                                              .read<CheckoutProvider>()
                                              .selectedPaymentMethod ==
                                          "Razorpay"
                                      ? 1
                                      : 0.3,
                                  color: context
                                              .read<CheckoutProvider>()
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
                                        image: "ic_razorpay",
                                        width: 25,
                                        height: 25),
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
                                        .read<CheckoutProvider>()
                                        .selectedPaymentMethod,
                                    activeColor: ColorsRes.appColor,
                                    onChanged: (value) {
                                      if (!context
                                          .read<CheckoutProvider>()
                                          .isPaymentUnderProcessing) {
                                        context
                                            .read<CheckoutProvider>()
                                            .setSelectedPaymentMethod(
                                                "Razorpay");
                                      }
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        if (paymentMethodsData.paystackPaymentMethod == "1")
                          GestureDetector(
                            onTap: () {
                              if (!context
                                  .read<CheckoutProvider>()
                                  .isPaymentUnderProcessing) {
                                context
                                    .read<CheckoutProvider>()
                                    .setSelectedPaymentMethod("Paystack");
                              }
                            },
                            child: Container(
                              padding: EdgeInsets.zero,
                              margin: EdgeInsets.symmetric(
                                  vertical: Constant.size5),
                              decoration: BoxDecoration(
                                color: context
                                            .read<CheckoutProvider>()
                                            .selectedPaymentMethod ==
                                        "Paystack"
                                    ? Theme.of(context).cardColor
                                    : Theme.of(context).scaffoldBackgroundColor,
                                borderRadius: Constant.borderRadius7,
                                border: Border.all(
                                  width: context
                                              .read<CheckoutProvider>()
                                              .selectedPaymentMethod ==
                                          "Paystack"
                                      ? 1
                                      : 0.3,
                                  color: context
                                              .read<CheckoutProvider>()
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
                                        image: "ic_paystack",
                                        width: 25,
                                        height: 25),
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
                                        .read<CheckoutProvider>()
                                        .selectedPaymentMethod,
                                    activeColor: ColorsRes.appColor,
                                    onChanged: (value) {
                                      if (!context
                                          .read<CheckoutProvider>()
                                          .isPaymentUnderProcessing) {
                                        context
                                            .read<CheckoutProvider>()
                                            .setSelectedPaymentMethod(
                                                "Paystack");
                                      }
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        if (paymentMethodsData.stripePaymentMethod == "1")
                          GestureDetector(
                            onTap: () {
                              if (!context
                                  .read<CheckoutProvider>()
                                  .isPaymentUnderProcessing) {
                                context
                                    .read<CheckoutProvider>()
                                    .setSelectedPaymentMethod("Stripe");
                              }
                            },
                            child: Container(
                              padding: EdgeInsets.zero,
                              margin: EdgeInsets.symmetric(
                                  vertical: Constant.size5),
                              decoration: BoxDecoration(
                                color: context
                                            .read<CheckoutProvider>()
                                            .selectedPaymentMethod ==
                                        "Stripe"
                                    ? Theme.of(context).cardColor
                                    : Theme.of(context).scaffoldBackgroundColor,
                                borderRadius: Constant.borderRadius7,
                                border: Border.all(
                                  width: context
                                              .read<CheckoutProvider>()
                                              .selectedPaymentMethod ==
                                          "Stripe"
                                      ? 1
                                      : 0.3,
                                  color: context
                                              .read<CheckoutProvider>()
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
                                        .read<CheckoutProvider>()
                                        .selectedPaymentMethod,
                                    activeColor: ColorsRes.appColor,
                                    onChanged: (value) {
                                      if (!context
                                          .read<CheckoutProvider>()
                                          .isPaymentUnderProcessing) {
                                        context
                                            .read<CheckoutProvider>()
                                            .setSelectedPaymentMethod("Stripe");
                                      }
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        if (paymentMethodsData.paytmPaymentMethod == "1")
                          GestureDetector(
                            onTap: () {
                              if (!context
                                  .read<CheckoutProvider>()
                                  .isPaymentUnderProcessing) {
                                context
                                    .read<CheckoutProvider>()
                                    .setSelectedPaymentMethod("Paytm");
                              }
                            },
                            child: Container(
                              padding: EdgeInsets.zero,
                              margin: EdgeInsets.symmetric(
                                  vertical: Constant.size5),
                              decoration: BoxDecoration(
                                color: context
                                            .read<CheckoutProvider>()
                                            .selectedPaymentMethod ==
                                        "Paytm"
                                    ? Theme.of(context).cardColor
                                    : Theme.of(context).scaffoldBackgroundColor,
                                borderRadius: Constant.borderRadius7,
                                border: Border.all(
                                  width: context
                                              .read<CheckoutProvider>()
                                              .selectedPaymentMethod ==
                                          "Paytm"
                                      ? 1
                                      : 0.3,
                                  color: context
                                              .read<CheckoutProvider>()
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
                                        image: "ic_paytm",
                                        width: 25,
                                        height: 25),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.only(
                                        start: Constant.size10),
                                    child: Text(
                                      getTranslatedValue(
                                        context,
                                        "paytm",
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
                                        .read<CheckoutProvider>()
                                        .selectedPaymentMethod,
                                    activeColor: ColorsRes.appColor,
                                    onChanged: (value) {
                                      if (!context
                                          .read<CheckoutProvider>()
                                          .isPaymentUnderProcessing) {
                                        context
                                            .read<CheckoutProvider>()
                                            .setSelectedPaymentMethod("Paytm");
                                      }
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        if (paymentMethodsData.paypalPaymentMethod == "1")
                          GestureDetector(
                            onTap: () {
                              if (!context
                                  .read<CheckoutProvider>()
                                  .isPaymentUnderProcessing) {
                                context
                                    .read<CheckoutProvider>()
                                    .setSelectedPaymentMethod("Paypal");
                              }
                            },
                            child: Container(
                              padding: EdgeInsets.zero,
                              margin: EdgeInsets.symmetric(
                                  vertical: Constant.size5),
                              decoration: BoxDecoration(
                                color: context
                                            .read<CheckoutProvider>()
                                            .selectedPaymentMethod ==
                                        "Paypal"
                                    ? Theme.of(context).cardColor
                                    : Theme.of(context).scaffoldBackgroundColor,
                                borderRadius: Constant.borderRadius7,
                                border: Border.all(
                                  width: context
                                              .read<CheckoutProvider>()
                                              .selectedPaymentMethod ==
                                          "Paypal"
                                      ? 1
                                      : 0.3,
                                  color: context
                                              .read<CheckoutProvider>()
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
                                        image: "ic_paypal",
                                        width: 25,
                                        height: 25),
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
                                        .read<CheckoutProvider>()
                                        .selectedPaymentMethod,
                                    activeColor: ColorsRes.appColor,
                                    onChanged: (value) {
                                      if (!context
                                          .read<CheckoutProvider>()
                                          .isPaymentUnderProcessing) {
                                        context
                                            .read<CheckoutProvider>()
                                            .setSelectedPaymentMethod("Paypal");
                                      }
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                      ],
                    )
                  ],
                ),
              ),
            )
      : const SizedBox.shrink();
}
