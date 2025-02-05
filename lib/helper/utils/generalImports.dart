export 'dart:async';
export 'dart:convert';
export 'dart:io';
export 'dart:math';
export 'dart:typed_data';

export 'package:awesome_notifications/awesome_notifications.dart';
export 'package:connectivity_plus/connectivity_plus.dart';
export 'package:country_code_picker/country_code_picker.dart';
export 'package:egrocer/firebase_options.dart';
export 'package:egrocer/helper/generalWidgets/OrderTrackingHistoryBottomSheet.dart';
export 'package:egrocer/helper/generalWidgets/bottomSheetLanguageListContainer.dart';
export 'package:egrocer/helper/generalWidgets/brandItemContainer.dart';
export 'package:egrocer/helper/generalWidgets/cartListItemContainer.dart';
export 'package:egrocer/helper/generalWidgets/categoryItemContainer.dart';
export 'package:egrocer/helper/generalWidgets/customCircularProgressIndicator.dart';
export 'package:egrocer/helper/generalWidgets/customRadio.dart';
export 'package:egrocer/helper/generalWidgets/customTextLabel.dart';
export 'package:egrocer/helper/generalWidgets/defaultBlankItemMessageScreen.dart';
export 'package:egrocer/helper/generalWidgets/editBoxWidget.dart';
export 'package:egrocer/helper/generalWidgets/noInternetConnectionScreen.dart';
export 'package:egrocer/helper/generalWidgets/productCartButton.dart';
export 'package:egrocer/helper/generalWidgets/productGridItemContainer.dart';
export 'package:egrocer/helper/generalWidgets/productListItemContainer.dart';
export 'package:egrocer/helper/generalWidgets/productVariantDropDownMenuGrid.dart';
export 'package:egrocer/helper/generalWidgets/productVariantDropDownMenuList.dart';
export 'package:egrocer/helper/generalWidgets/productWishListIcon.dart';
export 'package:egrocer/helper/generalWidgets/toastAnimation.dart';
export 'package:egrocer/helper/generalWidgets/trackMyOrderButton.dart';
export 'package:egrocer/helper/generalWidgets/widgets.dart';
export 'package:egrocer/helper/sessionManager.dart';
export 'package:egrocer/helper/styles/colorsRes.dart';
export 'package:egrocer/helper/styles/dashedRect.dart';
export 'package:egrocer/helper/styles/designConfig.dart';
export 'package:egrocer/helper/utils/apiAndParams.dart';
export 'package:egrocer/helper/utils/awsomeNotification.dart';
export 'package:egrocer/helper/utils/constant.dart';
export 'package:egrocer/helper/utils/generalMethods.dart';
export 'package:egrocer/helper/utils/mapDeliveredMarker.dart';
export 'package:egrocer/helper/utils/markergenerator.dart';
export 'package:egrocer/helper/utils/routeGenerator.dart';
export 'package:egrocer/helper/utils/stripeService.dart';
export 'package:egrocer/models/address.dart';
export 'package:egrocer/models/cartData.dart';
export 'package:egrocer/models/cartList.dart';
export 'package:egrocer/models/checkout.dart';
export 'package:egrocer/models/faq.dart';
export 'package:egrocer/models/geoAddress.dart';
export "package:egrocer/models/homeScreenData.dart";
export 'package:egrocer/models/initiateTransaction.dart';
export 'package:egrocer/models/languageList.dart';
export 'package:egrocer/models/notification.dart';
export 'package:egrocer/models/notificationSettings.dart';
export 'package:egrocer/models/order.dart';
export 'package:egrocer/models/paymentMethods.dart';
export 'package:egrocer/models/paytmTransactionToken.dart';
export 'package:egrocer/models/placedPrePaidOrder.dart';
export 'package:egrocer/models/productDetail.dart';
export 'package:egrocer/models/productList.dart';
export 'package:egrocer/models/productListItem.dart';
export 'package:egrocer/models/promoCode.dart';
export 'package:egrocer/models/settings.dart';
export 'package:egrocer/models/timeSlots.dart';
export 'package:egrocer/models/transaction.dart';
export 'package:egrocer/provider/SellerProvider.dart';
export 'package:egrocer/provider/activeOrdersProvider.dart';
export 'package:egrocer/provider/addressListProvider.dart';
export 'package:egrocer/provider/appLanguageProvider.dart';
export 'package:egrocer/provider/appSettingsProvider.dart';
export 'package:egrocer/provider/brandProvider.dart';
export 'package:egrocer/provider/cartListProvider.dart';
export 'package:egrocer/provider/cartProvider.dart';
export 'package:egrocer/provider/categoryProvider.dart';
export 'package:egrocer/provider/checkoutProvider.dart';
export 'package:egrocer/provider/cityByLatLongProvider.dart';
export 'package:egrocer/provider/countryProvider.dart';
export 'package:egrocer/provider/currentOrderProvider.dart';
export 'package:egrocer/provider/faqListProvider.dart';
export 'package:egrocer/provider/homeMainScreenProvider.dart';
export 'package:egrocer/provider/homeScreenDataProvider.dart';
export 'package:egrocer/provider/notificationListProvider.dart';
export 'package:egrocer/provider/notificationsSettingsProvider.dart';
export 'package:egrocer/provider/orderInvoiceProvider.dart';
export 'package:egrocer/provider/previousOrdersProvider.dart';
export 'package:egrocer/provider/productChangeListingProvider.dart';
export 'package:egrocer/provider/productDetailProvider.dart';
export 'package:egrocer/provider/productFilterProvider.dart';
export 'package:egrocer/provider/productListProvider.dart';
export 'package:egrocer/provider/productSearchProvider.dart';
export 'package:egrocer/provider/productWishListProvider.dart';
export 'package:egrocer/provider/promoCodeProvider.dart';
export 'package:egrocer/provider/ratingProvider.dart';
export 'package:egrocer/provider/selectedVariantItemProvider.dart';
export 'package:egrocer/provider/sliderImagesProvider.dart';
export 'package:egrocer/provider/transactionListProvider.dart';
export 'package:egrocer/provider/updateOrderStatusProvider.dart';
export 'package:egrocer/provider/userProfileProvider.dart';
export 'package:egrocer/provider/voiceToTextProvider.dart';
export 'package:egrocer/provider/walletHistoryListProvider.dart';
export 'package:egrocer/provider/walletRechargeProvider.dart';
export 'package:egrocer/repositories/addTransactionApi.dart';
export 'package:egrocer/repositories/addressApi.dart';
export 'package:egrocer/repositories/appLanguageApi.dart';
export 'package:egrocer/repositories/appSettingsApi.dart';
export 'package:egrocer/repositories/brandApi.dart';
export 'package:egrocer/repositories/cartApi.dart';
export 'package:egrocer/repositories/categoryApi.dart';
export 'package:egrocer/repositories/cityByLatLongApi.dart';
export 'package:egrocer/repositories/deleteUserAccountApi.dart';
export 'package:egrocer/repositories/faqApi.dart';
export 'package:egrocer/repositories/homeScreenApi.dart';
export 'package:egrocer/repositories/initiateTransactionApi.dart';
export 'package:egrocer/repositories/loginApi.dart';
export 'package:egrocer/repositories/notificationApi.dart';
export 'package:egrocer/repositories/notificationSettingsApi.dart';
export 'package:egrocer/repositories/orderInvoiceApi.dart';
export 'package:egrocer/repositories/ordersApi.dart';
export 'package:egrocer/repositories/paymentMethodsSettingsApi.dart';
export 'package:egrocer/repositories/placeOrderApi.dart';
export 'package:egrocer/repositories/productApi.dart';
export 'package:egrocer/repositories/promoCodeApi.dart';
export 'package:egrocer/repositories/registerFcmKey.dart';
export 'package:egrocer/repositories/timeSlotSettingsApi.dart';
export 'package:egrocer/repositories/transactionApi.dart';
export 'package:egrocer/repositories/updateProfileApi.dart';
export 'package:egrocer/repositories/userDetailApi.dart';
export 'package:egrocer/screens/appUpdateScreen.dart';
export 'package:egrocer/screens/authenticationScreen/loginAccount.dart';
export 'package:egrocer/screens/authenticationScreen/otpVerificationScreen.dart';
export 'package:egrocer/screens/brandListScreen.dart';
export 'package:egrocer/screens/cartListScreen/cartListScreen.dart';
export 'package:egrocer/screens/cartListScreen/screens/promoCodeScreen/promoCodeScreen.dart';
export 'package:egrocer/screens/checkoutScreen/checkoutScreen.dart';
export 'package:egrocer/screens/checkoutScreen/widget/addressWidget.dart';
export 'package:egrocer/screens/checkoutScreen/widget/deliveryChargesWidget.dart';
export 'package:egrocer/screens/checkoutScreen/widget/paymentMethodWidget.dart';
export 'package:egrocer/screens/checkoutScreen/widget/placeOrderButtonWidget.dart';
export 'package:egrocer/screens/checkoutScreen/widget/timeSlotsWidget.dart';
export 'package:egrocer/screens/confirmLocationScreen/confirmLocationScreen.dart';
export 'package:egrocer/screens/confirmLocationScreen/widget/confirmButtonWidget.dart';
export 'package:egrocer/screens/countryListScreen.dart';
export 'package:egrocer/screens/editProfileScreen.dart';
export 'package:egrocer/screens/introSliderScreen.dart';
export 'package:egrocer/screens/mainHomeScreen/categoryListScreen.dart';
export 'package:egrocer/screens/mainHomeScreen/homeScreen/homeScreen.dart';
export 'package:egrocer/screens/mainHomeScreen/homeScreen/widget/customDialog.dart';
export 'package:egrocer/screens/mainHomeScreen/homeScreen/widget/homeScreenProductListItem.dart';
export 'package:egrocer/screens/mainHomeScreen/homeScreen/widget/offerImagesWidget.dart';
export 'package:egrocer/screens/mainHomeScreen/homeScreen/widget/sliderImageWidget.dart';
export 'package:egrocer/screens/mainHomeScreen/mainHomeScreen.dart';
export 'package:egrocer/screens/mainHomeScreen/profileMenuScreen/profileMenuScreen.dart';
export 'package:egrocer/screens/mainHomeScreen/profileMenuScreen/screens/addressScreen/addressDetailScreen.dart';
export 'package:egrocer/screens/mainHomeScreen/profileMenuScreen/screens/addressScreen/addressListScreen.dart';
export 'package:egrocer/screens/mainHomeScreen/profileMenuScreen/screens/faqListScreen.dart';
export 'package:egrocer/screens/mainHomeScreen/profileMenuScreen/screens/notificationListScreen.dart';
export 'package:egrocer/screens/mainHomeScreen/profileMenuScreen/screens/notificationsAndMailSettingsScreen.dart';
export 'package:egrocer/screens/mainHomeScreen/profileMenuScreen/screens/transactionListScreen.dart';
export 'package:egrocer/screens/mainHomeScreen/profileMenuScreen/screens/walletHistoryListScreen.dart';
export 'package:egrocer/screens/mainHomeScreen/profileMenuScreen/screens/webViewScreen.dart';
export 'package:egrocer/screens/mainHomeScreen/profileMenuScreen/widget/buttonWidget.dart';
export 'package:egrocer/screens/mainHomeScreen/profileMenuScreen/widget/profileHeader.dart';
export 'package:egrocer/screens/mainHomeScreen/profileMenuScreen/widget/quickUseWidget.dart';
export 'package:egrocer/screens/mainHomeScreen/wishListScreen.dart';
export 'package:egrocer/screens/orderPlacedScreen.dart';
export 'package:egrocer/screens/orderSummaryScreen/orderSummaryScreen.dart';
export 'package:egrocer/screens/orderSummaryScreen/widgets/cancelProductDialog.dart';
export 'package:egrocer/screens/orderSummaryScreen/widgets/returnProductDialog.dart';
export 'package:egrocer/screens/orderSummaryScreen/widgets/submitRatingWidget.dart';
export 'package:egrocer/screens/ordersHistoryScreen/ordersHistoryScreen.dart';
export 'package:egrocer/screens/ordersHistoryScreen/previousOrdersHistoryScreen.dart';
export 'package:egrocer/screens/ordersHistoryScreen/widgets/cancelOrderDialog.dart';
export 'package:egrocer/screens/ordersHistoryScreen/widgets/returnOrderDialog.dart';
export 'package:egrocer/screens/paypalPaymentScreen.dart';
export 'package:egrocer/screens/productDetailScreen/productDetailScreen.dart';
export 'package:egrocer/screens/productDetailScreen/widget/otherImagesBoxDecoration.dart';
export 'package:egrocer/screens/productFullScreenImagesScreen.dart';
export 'package:egrocer/screens/productListFilterScreen/productListFilterScreen.dart';
export 'package:egrocer/screens/productListFilterScreen/widget/brandWidget.dart';
export 'package:egrocer/screens/productListFilterScreen/widget/priceRangeWidget.dart';
export 'package:egrocer/screens/productListFilterScreen/widget/sizeWidget.dart';
export 'package:egrocer/screens/productListScreen.dart';
export 'package:egrocer/screens/ratingAndReviewScreen.dart';
export 'package:egrocer/screens/searchProductScreen/searchProductScreen.dart';
export 'package:egrocer/screens/searchProductScreen/widget/speechToTextSearch.dart';
export 'package:egrocer/screens/sellerListScreen.dart';
export 'package:egrocer/screens/splashScreen.dart';
export 'package:egrocer/screens/subCategoryListScreen.dart';
export 'package:egrocer/screens/underMaintenanceScreen.dart';
export 'package:egrocer/screens/walletRechargeScreen/walletRechargeScreen.dart';
export 'package:external_path/external_path.dart';
export 'package:file_picker/file_picker.dart';
export 'package:firebase_auth/firebase_auth.dart';
export 'package:firebase_core/firebase_core.dart';
export 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
export 'package:firebase_messaging/firebase_messaging.dart';
export 'package:flutter/foundation.dart';
export 'package:flutter/gestures.dart';
export 'package:flutter/material.dart';
export 'package:flutter/rendering.dart';
export 'package:flutter/services.dart';
export 'package:flutter_paystack/flutter_paystack.dart';
export 'package:flutter_svg/flutter_svg.dart';
export 'package:flutter_swipe_button/flutter_swipe_button.dart';
export 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
export 'package:google_fonts/google_fonts.dart';
export 'package:google_maps_flutter/google_maps_flutter.dart';
export 'package:open_filex/open_filex.dart';
export 'package:package_info_plus/package_info_plus.dart';
export 'package:path_provider/path_provider.dart';
export 'package:paytm/paytm.dart';
export 'package:permission_handler/permission_handler.dart';
export 'package:photo_view/photo_view.dart';
export 'package:photo_view/photo_view_gallery.dart';
export 'package:pinput/pinput.dart';
export 'package:provider/provider.dart';
export 'package:razorpay_flutter/razorpay_flutter.dart';
export 'package:share_plus/share_plus.dart';
export 'package:shared_preferences/shared_preferences.dart';
export 'package:shimmer/shimmer.dart';
export 'package:speech_to_text/speech_recognition_error.dart';
export 'package:speech_to_text/speech_recognition_result.dart';
export 'package:speech_to_text/speech_to_text.dart';
export 'package:url_launcher/url_launcher.dart';
export 'package:version/version.dart';
export 'package:webview_flutter/webview_flutter.dart';
