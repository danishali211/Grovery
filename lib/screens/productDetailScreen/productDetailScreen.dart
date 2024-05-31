import 'package:egrocer/helper/utils/generalImports.dart';
import 'package:egrocer/screens/productDetailScreen/widget/productDetailWidget.dart';

class ProductDetailScreen extends StatefulWidget {
  final String? title;
  final String id;
  final ProductListItem? productListItem;

  const ProductDetailScreen(
      {Key? key, this.title, required this.id, this.productListItem})
      : super(key: key);

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  void initState() {
    super.initState();
    //fetch productList from api
    Future.delayed(Duration.zero).then((value) async {
      if (mounted) {
        try {
          Map<String, String> params =
              await Constant.getProductsDefaultParams();
          params[ApiAndParams.id] = widget.id;

          context.read<RatingListProvider>().getRatingApiProvider(
            params: {ApiAndParams.productId: widget.id.toString()},
            context: context,
            limit: "2",
          ).then(
            (value) async {
              context.read<RatingListProvider>().getRatingImagesApiProvider(
                  params: {ApiAndParams.productId: widget.id.toString()},
                  limit: "5",
                  context: context).then(
                (value) async => await context
                    .read<ProductDetailProvider>()
                    .getProductDetailProvider(
                      context: context,
                      params: params,
                    ),
              );
            },
          );
        } catch (_) {}
      }
    });
  }

  @override
  dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(
        context: context,
        title: CustomTextLabel(
          text: widget.title ?? getTranslatedValue(context, "products"),
          softWrap: true,
          style: TextStyle(color: ColorsRes.mainTextColor),
        ),
        actions: [
          Consumer<ProductDetailProvider>(
              builder: (context, productDetailProvider, child) {
            if (productDetailProvider.productDetailState ==
                ProductDetailState.loaded) {
              ProductData product = productDetailProvider.productDetail.data;
              return GestureDetector(
                onTap: () async {
                  await GeneralMethods.createDynamicLink(
                    context: context,
                    shareUrl: "${Constant.hostUrl}product/${product.id}",
                    imageUrl: product.imageUrl,
                    title: product.name,
                    description:
                        "<h1>${product.name}</h1><br><br><h2>${product.variants[0].measurement} ${product.variants[0].stockUnitName}</h2>",
                  ).then(
                    (value) async => await Share.share(
                        "${product.name}\n\n$value",
                        subject: "Share app"),
                  );
                },
                child: defaultImg(
                    image: "share_icon",
                    height: 24,
                    width: 24,
                    padding: const EdgeInsetsDirectional.only(
                      top: 5,
                      bottom: 5,
                      end: 15,
                    ),
                    iconColor: Theme.of(context).primaryColor),
              );
            } else {
              return SizedBox.shrink();
            }
          }),
          Consumer<ProductDetailProvider>(
            builder: (context, productDetailProvider, child) {
              if (productDetailProvider.productDetailState ==
                  ProductDetailState.loaded) {
                ProductData product = productDetailProvider.productDetail.data;
                return GestureDetector(
                  onTap: () async {
                    if (Constant.session.isUserLoggedIn()) {
                      Map<String, String> params = {};
                      params[ApiAndParams.productId] = product.id.toString();

                      await context
                          .read<ProductAddOrRemoveFavoriteProvider>()
                          .getProductAddOrRemoveFavorite(
                              params: params,
                              context: context,
                              productId: int.parse(product.id))
                          .then((value) {
                        if (value) {
                          context
                              .read<ProductWishListProvider>()
                              .addRemoveFavoriteProduct(widget.productListItem);
                        }
                      });
                    } else {
                      loginUserAccount(context, "wishlist");
                    }
                  },
                  child: Transform.scale(
                    scale: 1.5,
                    child: Container(
                      padding: const EdgeInsetsDirectional.only(
                        top: 5,
                        bottom: 5,
                        end: 10,
                      ),
                      child: ProductWishListIcon(
                        product: Constant.session.isUserLoggedIn()
                            ? widget.productListItem
                            : null,
                        isListing: false,
                      ),
                    ),
                  ),
                );
              } else {
                return SizedBox.shrink();
              }
            },
          ),
        ],
      ),
      body: Consumer<ProductDetailProvider>(
        builder: (context, productDetailProvider, child) {
          return Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      productDetailProvider.productDetailState ==
                              ProductDetailState.loaded
                          ? ChangeNotifierProvider<SelectedVariantItemProvider>(
                              create: (context) =>
                                  SelectedVariantItemProvider(),
                              child: ProductDetailWidget(context,
                                  productDetailProvider.productDetail.data),
                            )
                          : productDetailProvider.productDetailState ==
                                  ProductDetailState.loading
                              ? getProductDetailShimmer(context: context)
                              : const SizedBox.shrink(),
                    ],
                  ),
                ),
              ),
              Padding(
                padding:
                    EdgeInsetsDirectional.only(start: 10, end: 10, bottom: 15),
                child: gradientBtnWidget(
                  context,
                  10,
                  callback: () {
                    Navigator.pushNamed(context, cartScreen);
                  },
                  title: getTranslatedValue(context, "go_to_cart"),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  getProductDetailShimmer({required BuildContext context}) {
    return CustomShimmer(
      height: context.height,
      width: context.width,
    );
  }
}
