import 'package:egrocer/helper/utils/generalImports.dart';

Widget ProductDetailImportantInformationWidget(
  BuildContext context,
  ProductData product,
) {
  String productType = product.indicator.toString();
  String cancelableStatus = product.cancelableStatus.toString();
  String returnStatus = product.returnStatus.toString();
  return Container(
    padding: EdgeInsetsDirectional.all(10),
    margin: EdgeInsetsDirectional.only(top: 10, start: 10, end: 10),
    decoration: DesignConfig.boxDecoration(Theme.of(context).cardColor, 5),
    child: Column(
      children: [
        Row(
          children: [
            if (productType != "null")
              Expanded(
                child: Column(
                  children: [
                    defaultImg(
                      height: context.width * 0.1,
                      width: context.width * 0.1,
                      image: productType == "1"
                          ? "product_veg_indicator"
                          : "product_non_veg_indicator",
                    ),
                    getSizedBox(height: 10),
                    CustomTextLabel(
                      jsonKey:
                          productType == "1" ? "vegetarian" : "non_vegetarian",
                      style: TextStyle(
                        color: ColorsRes.subTitleMainTextColor,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            Expanded(
              child: Column(
                children: [
                  defaultImg(
                    height: context.width * 0.1,
                    width: context.width * 0.1,
                    image: cancelableStatus == "1"
                        ? "product_cancellable"
                        : "product_non_cancellable",
                  ),
                  getSizedBox(height: 10),
                  CustomTextLabel(
                    jsonKey: cancelableStatus == "1"
                        ? "cancellable"
                        : "non_cancellable",
                    style: TextStyle(
                      color: ColorsRes.subTitleMainTextColor,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  defaultImg(
                    height: context.width * 0.1,
                    width: context.width * 0.1,
                    image: returnStatus == "1"
                        ? "product_returnable"
                        : "product_non_returnable",
                  ),
                  getSizedBox(height: 10),
                  CustomTextLabel(
                    jsonKey:
                        returnStatus == "1" ? "returnable" : "non_returnable",
                    style: TextStyle(
                      color: ColorsRes.subTitleMainTextColor,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        if (cancelableStatus == "1") getSizedBox(height: Constant.size10),
        if (cancelableStatus == "1")
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.check_circle_rounded,
                size: 18,
              ),
              getSizedBox(width: 5),
              Expanded(
                child: CustomTextLabel(
                  text:
                      "${getTranslatedValue(context, "product_is_cancellable_till")} ${Constant.getOrderActiveStatusLabelFromCode(product.tillStatus, context)}",
                ),
              )
            ],
          ),
        if (returnStatus == "1") getSizedBox(height: Constant.size10),
        if (returnStatus == "1")
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.check_circle_rounded,
                size: 18,
              ),
              getSizedBox(width: 5),
              Expanded(
                child: CustomTextLabel(
                  text:
                      "${getTranslatedValue(context, "product_is_returnable_till")} ${product.returnDays} ${getTranslatedValue(context, "days")}",
                ),
              )
            ],
          ),
      ],
    ),
  );
}
