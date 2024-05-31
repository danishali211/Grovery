import 'package:egrocer/helper/utils/generalImports.dart';

class ProductListRatingBuilderWidget extends StatelessWidget {
  final double averageRating;
  final int totalRatings;
  final double? size;
  final double? spacing;

  ProductListRatingBuilderWidget({
    super.key,
    required this.averageRating,
    required this.totalRatings,
    this.size,
    this.spacing,
  });

  @override
  Widget build(BuildContext context) {
    return totalRatings != 0
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  getSizedBox(width: 5),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: List.generate(
                      5,
                      (index) {
                        return defaultImg(
                            image: "rate_icon",
                            iconColor:
                                averageRating.toString().toDouble.round() >=
                                        index + 1
                                    ? ColorsRes.activeRatingColor
                                    : ColorsRes.deActiveRatingColor,
                            height: size,
                            width: size,
                            padding:
                                EdgeInsetsDirectional.only(end: spacing ?? 0));
                      },
                    ),
                  ),
                  getSizedBox(width: 5),
                  CustomTextLabel(
                    text: "(${totalRatings})",
                    style: TextStyle(
                      color: ColorsRes.subTitleMainTextColor,
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              getSizedBox(height: 5),
            ],
          )
        : SizedBox.shrink();
  }
}
