import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'app_assets.dart';

class AppConstants {
  static const double padding = 20;

  static const OnboardingContent onboardingContent = [
    (image: "", title: "Seamless Shopping Experience", subtitle: "Get Started with Personalized Style Recommendations"),
    (image: "", title: "Wishlist: Where Fashion Dreams Begin", subtitle: "You’re All Set—Enjoy Your New Fashion"),
    (image: "", title: "Swift And Reliable Delivery", subtitle: "Stay on-trend with the latest styles delivered straight to your phone"),
  ];

  static List<String> locations = [
    'Cairo',
    'Alexandria',
    'Giza',
    'Port Said',
    'Suez',
    'Shubra El Kheima',
    'Luxor',
    'Aswan',
    'Asyut',
    'Qena',
    'Sohag',
    'Minya',
    'Beni Suef',
    'Fayoum',
    'Gharbia',
    'Daqahlia',
    'Kafr El Sheikh',
    'Behaira',
    'Ismailia',
    'Sharqia',
    'Matruh',
    'Red Sea',
    'North Sinai',
    'South Sinai'
  ].map((location) => "$location, Egypt").toList();

  static const List<CarouselData> carouselSliderData = [
    (images: AppAssets.womanModelImage, title: "New Collection", subTitle: "50% OFF on Summer Collection!"),
    (images: AppAssets.womanModelImage, title: "New Arrivals", subTitle: "Discount %50 for the first transaction "),
    (images: AppAssets.womanModelImage, title: "New Arrivals", subTitle: "Discount %40 for the second transaction "),
    (images: AppAssets.womanModelImage, title: "New Collection", subTitle: "Discount %50 for the first transaction "),
    (images: AppAssets.womanModelImage, title: "Buy One Get One Free", subTitle: "Discount %50 for the first transaction "),
  ];

  static const ShowModelBottomSheetDetails showModelBottomSheetDetails = [
    (hintText: "Sub-Total", price: "407.085"),
    (hintText: "Delivery fee", price: "25.056"),
    (hintText: "Discount", price: "35")
  ];

  static const CategoryIcons categoryIcons = [
    (image: AppAssets.shirtIcon, name: "T-Shirt"),
    (image: AppAssets.pantIcon, name: "Pant"),
    (image: AppAssets.dressIcon, name: "Dress"),
    (image: AppAssets.jacketIcon, name: "Jacket"),
  ];
  static const PaymentCategories paymentOption = [
    (image: "assets/images/paypal.png", title: "PayPal"),
    (image: "assets/images/social-media.png", title: "Apple Pay"),
    (image: "assets/images/search.png", title: "Google Pay"),
  ];

  static const CouponsDetails couponDetails = [
    (header: "Welcome200", content: "Add items worth \$5 more to unlock", discount: "Get 50% off"),
    (header: "CashBack12", content: "Add items worth \$28 more to unlock", discount: "Get 50% off Combo"),
    (header: "Welcome200", content: "Add items worth \$20 more to unlock", discount: "Get 50% off"),
    (header: "FEST2COST", content: "Add items worth \$15 more to unlock", discount: "Up to \$12 cashback"),
  ];
  static const ShippingCategories shippingCategories = [
    (address: "Economy", location: "Estimated arrival time 25 May 2025", icon: Icons.car_rental_rounded),
    (address: "Regular", location: "Estimated arrival time 25 May 2025", icon: Icons.car_rental_rounded),
    (address: "Cargo", location: "Estimated arrival time 25 May 2025", icon: Icons.car_rental_rounded),
    (address: "Friend's House ", location: "Estimated arrival time 25 May 2025", icon: Icons.car_rental_rounded),
  ];

  static const List<String> chips = ["All", "Man", "Woman", "Newest", "Popular"];

  static const List<String> brands = ['All', 'Nike', 'Adidas', 'Puma', 'Yousef'];

  static const List<String> gender = ['All', 'Men', 'Woman'];

  static const List<String> sortBy = ['Most Recent', 'Popular', 'Price High', 'Price Low'];

  static const List<String> privacy = ["All", "Services", "General", "Accounts"];

  static const HelpCenterContent helpCenterContent = [
    (
      content: "Ensuring that customers can make purchases without their identities being publicly disclosed. ",
      title: "Can I track my order's delivery status?"
    ),
    (content: "Ensuring that customers can make purchases without their identities being publicly disclosed. ", title: "Is there a return policy?"),
    (
      content: "Ensuring that customers can make purchases without their identities being publicly disclosed. ",
      title: "Can I save my favorite item for late?"
    ),
    (
      content: "Ensuring that customers can make purchases without their identities being publicly disclosed. ",
      title: "Can I share the products with my friends?"
    ),
    (
      content: "Ensuring that customers can make purchases without their identities being publicly disclosed. ",
      title: "How do i contact the customer support?"
    ),
    (
      content: "Ensuring that customers can make purchases without their identities being publicly disclosed. ",
      title: "Which payment methods are accepted?"
    ),
    (content: "Ensuring that customers can make purchases without their identities being publicly disclosed. ", title: "How to add a review?"),
  ];

  static const ContactUs contactUs = [
    (
      content: "Ensuring that customers can make purchases without their identities being publicly disclosed. ",
      title: "Customer services",
      icon: FontAwesomeIcons.headphones
    ),
    (
      content: "Ensuring that customers can make purchases without their identities being publicly disclosed. ",
      title: "WhatsApp?",
      icon: FontAwesomeIcons.whatsapp
    ),
    (
      content: "Ensuring that customers can make purchases without their identities being publicly disclosed. ",
      title: "Websites?",
      icon: FontAwesomeIcons.language
    ),
    (
      content: "Ensuring that customers can make purchases without their identities being publicly disclosed. ",
      title: "FaceBook",
      icon: FontAwesomeIcons.facebook
    ),
    (
      content: "Ensuring that customers can make purchases without their identities being publicly disclosed. ",
      title: "Twitter",
      icon: FontAwesomeIcons.xTwitter
    ),
    (
      content: "Ensuring that customers can make purchases without their identities being publicly disclosed. ",
      title: "Instagram",
      icon: FontAwesomeIcons.instagram
    ),
  ];

  static final List<({IconData icon, IconData iconFilled})> navigationData = [
    (icon: Icons.home_outlined, iconFilled: Icons.home_filled),
    (icon: Icons.shopping_bag_outlined, iconFilled: Icons.shopping_bag_rounded),
    (icon: Icons.favorite_outline_rounded, iconFilled: Icons.favorite_rounded),
    (icon: Icons.chat_bubble_outline_rounded, iconFilled: Icons.chat_bubble_rounded),
    (icon: Icons.person_pin, iconFilled: Icons.person_pin)
  ];

  static const List<({String title, IconData icon})> profileTiles = [
    (title: "Your Profile", icon: Icons.person),
    (title: "My Orders", icon: Icons.list_alt_rounded),
    (title: "Settings", icon: Icons.settings),
    (title: "Payment Methods", icon: Icons.payment_rounded),
    (title: "Help Center", icon: Icons.help_outline_rounded),
    (title: "Privacy Policy", icon: Icons.lock_rounded),
    (title: "Invites Friends", icon: Icons.group_add_outlined),
    (title: "Log Out", icon: Icons.logout_rounded)
  ];
}

typedef CategoryIcons = List<({String image, String name})>;
typedef PaymentCategories = List<({String image, String title})>;
typedef HelpCenterContent = List<({String title, String content})>;
typedef ContactUs = List<({String title, String content, IconData icon})>;
typedef ShowModelBottomSheetDetails = List<({String hintText, String price})>;
typedef CouponsDetails = List<({String header, String content, String discount})>;
typedef OnboardingContent = List<({String image, String title, String subtitle})>;
typedef CarouselData = ({String title, String subTitle, String images});
typedef ShippingCategories = List<({String location, String address, IconData icon})>;
