import 'package:get/get.dart';
import 'package:store_getx_app/presentation/main_view/pages/my_cart/e_receipt_screen.dart';
import 'package:store_getx_app/presentation/main_view/pages/my_cart/leave_review_screen.dart';
import 'package:store_getx_app/presentation/main_view/pages/my_cart/my_orders.dart';

import '../auth/forget_password_screen.dart';
import '../auth/sign_in_screen.dart';
import '../auth/sign_up_screen.dart';
import '../auth/verify_code_screen.dart';
import '../main_view/main_view.dart';
import '../main_view/pages/home/location.dart';
import '../main_view/pages/home/product_details.dart';
import '../main_view/pages/my_cart/checkout_screen.dart';
import '../main_view/pages/my_cart/choose_shipping_screen.dart';
import '../main_view/pages/my_cart/coupon_screen.dart';
import '../main_view/pages/my_cart/my_cart_page.dart';
import '../main_view/pages/my_cart/payment_methods_screen.dart';
import '../main_view/pages/my_cart/payment_screen.dart';
import '../main_view/pages/my_cart/shopping_address_screen.dart';
import '../main_view/pages/my_cart/visa_card_screen.dart';
import '../main_view/pages/profile/profile_page.dart';
import '../main_view/pages/profile/settings/password_manager_screen.dart';
import '../main_view/pages/profile/settings/theme_and_localization_screen.dart';
import '../main_view/pages/profile/update_profile.dart';
import '../onboarding/onboarding_screen.dart';
import '../splash/splash_screen.dart';

class NamedRoutes {
  NamedRoutes._();

  static const String splashScreen = "/splashScreen";
  //
  static const String onboardingScreen = "/onboardingScreen";

  // Authentication
  static const String signInScreen = "/signInScreen";
  static const String signUpScreen = "/signUpScreen";
  static const String verifyCodeScreen = "/verifyCodeScreen";
  static const String forgotPasswordScreen = "/forgotPasswordScreen";

  //
  static const String mainView = "/mainView";
  static const String location = "/location";
  static const String bodyDetails = "/bodyDetails";
  static const String productDetails = "/productDetails";

  // MyCart Page
  static const String myCartPage = "/myCartPage";
  static const String couponScreen = "/couponScreen";
  static const String paymentScreen = "/paymentScreen";
  static const String checkoutScreen = "/checkoutScreen";
  static const String leaveReviewScreen = "/leaveReviewScreen";
  static const String paymentMethods = "/paymentMethods";
  static const String shippingScreen = "/shippingScreen";
  static const String visaCardScreen = "/visaCardScreen";
  static const String shoppingAddress = "/shoppingAddress";
  static const String myOrders = "/myOrders";
  static const String receiptScreen = "/receiptScreen";


  // Profile Page
  static const String profilePage = "/profilePage";
  static const String settingsScreen = "/settingsScreen";
  static const String updateProfile = "/updateProfileScreen";
  //
  static const String passwordManagerScreen = "/passwordManagerScreen";
}

class RouteGenerator {
  static List<GetPage> getRoute() {
    return [
      GetPage(name: NamedRoutes.splashScreen, page: () => const SplashScreen()),
      GetPage(name: NamedRoutes.onboardingScreen, page: () => const OnboardingScreen()),
      GetPage(name: NamedRoutes.settingsScreen, page: () => const SettingScreen()),

      // Authentication
      GetPage(name: NamedRoutes.signInScreen, page: () => const SignInScreen()),
      GetPage(name: NamedRoutes.signUpScreen, page: () => const SignUpScreen()),
      GetPage(name: NamedRoutes.forgotPasswordScreen, page: () => const ForgotPasswordScreen()),
      GetPage(name: NamedRoutes.verifyCodeScreen, page: () => const VerifyCodeScreen(email: "example@gmail.com")),
      //
      GetPage(name: NamedRoutes.mainView, page: () => const MainView()),
      GetPage(name: NamedRoutes.location, page: () => const Location()),
      GetPage(name: NamedRoutes.productDetails, page: () => const ProductDetails()),

      // MyCart
      GetPage(name: NamedRoutes.myOrders, page: () => const MyOrders()),
      GetPage(name: NamedRoutes.myCartPage, page: () => const MyCartPage()),
      GetPage(name: NamedRoutes.couponScreen, page: () => const CouponScreen()),
      GetPage(name: NamedRoutes.paymentScreen, page: () => const PaymentScreen()),
      GetPage(name: NamedRoutes.visaCardScreen, page: () => const VisaCardScreen()),
      GetPage(name: NamedRoutes.leaveReviewScreen, page: () => const LeaveReviewScreen()),

      GetPage(name: NamedRoutes.checkoutScreen, page: () => const CheckoutScreen()),
      GetPage(name: NamedRoutes.shippingScreen, page: () => const ChooseShippingScreen()),
      GetPage(name: NamedRoutes.paymentMethods, page: () => const PaymentMethodsScreen()),
      GetPage(name: NamedRoutes.shoppingAddress, page: () => const ShoppingAddressScreen()),
      GetPage(name: NamedRoutes.receiptScreen, page: () => const ReceiptScreen()),
      
      // Profile
      GetPage(name: NamedRoutes.profilePage, page: () => const ProfilePage()),
      GetPage(name: NamedRoutes.updateProfile, page: () => const UpdateProfile()),
      GetPage(name: NamedRoutes.settingsScreen, page: () => const SettingScreen()),
      GetPage(name: NamedRoutes.passwordManagerScreen, page: () => const PasswordManagerScreen()),
    ];
  }
}
