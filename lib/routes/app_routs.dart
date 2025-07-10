import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ushop/featuers/products.dart/views/screens/all_products_screen.dart';
import 'package:ushop/featuers/profile_featuers/adresses/views/screens/adresses_screen.dart';
import 'package:ushop/featuers/store/views/screens/store_screen.dart';
import 'package:ushop/featuers/sub_categories/views/screens/subcategory_screen.dart';
import '../featuers/authentication/login/views/screens/login_screen.dart';
import '../featuers/authentication/onboarding/bindings/onboard_bindings.dart';
import '../featuers/authentication/onboarding/views/screens/onboarding_screen.dart';
import '../featuers/authentication/sign_up/views/screens/email_verify_screen.dart';
import '../featuers/authentication/sign_up/views/screens/forget_password_screen.dart';
import '../featuers/authentication/sign_up/views/screens/sign_up_screen.dart';
import '../featuers/authentication/sign_up/views/screens/verify_complated_screen.dart';
import '../featuers/bottom_navigation_menu/bindings/bottom_navigation_menu_bindings.dart';
import '../featuers/bottom_navigation_menu/views/screens/bottom_navigation_menu.dart';
import '../featuers/shopping_featuers/items_cart/views/screens/items_cart_screen.dart';

class AppRouts {
  static const String loading = "/";
  static const String onBoardingScreen = "/onBoardingScreen";
  static const String loginScreen = "/loginScreen";
  static const String registerScreen = "/registerScreen";
  static const String emailVerifyScreen = "/emailVerifyScreen";
  static const String verifyComplatedScreen = "/verifyComplatedScreen";
  static const String forgetPasswordScreen = "/forgetPasswordScreen";
  static const String resetEmailSentScreen = "/resetEmailSentScreen";
  static const String bottomNavigationMenu = "/bottomNavigationMenu";
  static const String itemCardScreen = "/itemCardScreen";
  static const String storeScreen = "/storeScreen";
  static const String subCategoryScreen = "/subCategoryScreen";
  static const String adressScreen = "/adressScreen";
  static const String allProductsScreen = "/allProductsScreen";

  static List<GetPage<dynamic>> getPages = [
    GetPage(name: loading, page: () => const Scaffold(body: Center(child: CircularProgressIndicator()))),
    GetPage(name: onBoardingScreen, page: () => const OnBoardingScreen(), binding: OnBoardBindings()),
    GetPage(name: loginScreen, page: () => const LoginScreen()),
    GetPage(name: registerScreen, page: () => const SignUpScreen()),
    GetPage(name: emailVerifyScreen, page: () => const EmailVerifyScreen()),
    GetPage(name: verifyComplatedScreen, page: () => const VerifyComplatedScreen()),
    GetPage(name: forgetPasswordScreen, page: () => const ForgetPasswordScreen()),
    // GetPage(name: resetEmailSentScreen, page: () => const ResetEmailSentScreen()),
    GetPage(name: bottomNavigationMenu, page: () => const BottomNavigationMenu(), binding: BottomNavigationMenuBindings()),
    GetPage(name: itemCardScreen, page: () => const ItemsCartScreen()),
    GetPage(name: storeScreen, page: () => const StoreScreen()),
    GetPage(name: subCategoryScreen, page: () => const SubCategoryScreen()),
    GetPage(name: adressScreen, page: () => const AddressesScreen()),
    GetPage(name: allProductsScreen, page: () => const AllProductsScreen()),
  ];
}
