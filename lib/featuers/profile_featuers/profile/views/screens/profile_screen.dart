import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../common/widgets/buttons/logout_button.dart';
import '../../../../../common/widgets/titles/custome_title.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/texts.dart';
import '../../../../../utils/popups/app_popups.dart';
import '../../../adresses/views/screens/adresses_screen.dart';
import '../../../orders/views/screens/orders_screens.dart';
import '../../controllers/logout_controller.dart';
import '../widgets/profile_page_header.dart';
import '../widgets/profile_setting_option.dart';

class ProfielScreen extends StatelessWidget {
  const ProfielScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LogoutController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //! ---> account setting header
            const ProfilePageHeader(),
            const CustomeTitle(title: AppTexts.accountSettings),
            const SizedBox(height: AppSizes.spaceBtwItems),

            //! ---> address List option
            ProfileSettingsOption(title: AppTexts.addressList, subtitle: AppTexts.addressListSubtitle, icon: Iconsax.safe_home, onTap: () => Get.to(() => const AddressesScreen())),

            //! ---> my orders Option
            ProfileSettingsOption(title: AppTexts.myOrders, subtitle: AppTexts.myOrdersSubtitle, icon: Iconsax.shopping_bag, onTap: () => Get.to(() => const OrdersScreen())),

            //! ---> instance payment option
            const ProfileSettingsOption(title: AppTexts.instancePayment, subtitle: AppTexts.instancePaymentSubtitle, icon: Iconsax.wallet),

            //! ---> bank accoutn option
            const ProfileSettingsOption(title: AppTexts.bankAccount, subtitle: AppTexts.bankAccountSubtitle, icon: Iconsax.bank),

            //! ---> account security option
            const ProfileSettingsOption(title: AppTexts.accountSecurity, subtitle: AppTexts.accountSecuritySubtitle, icon: Iconsax.security_card),

            //! ---> notifications Option
            const ProfileSettingsOption(title: AppTexts.notifications, subtitle: AppTexts.notificationsSubtitle, icon: Iconsax.notification),

            //! ---> account privacy
            const ProfileSettingsOption(title: AppTexts.accountPrivacy, subtitle: AppTexts.accountPrivacySubtitle, icon: Iconsax.security),

            //! ---> appsettings header
            const SizedBox(height: AppSizes.spaceBtwItems),
            const CustomeTitle(title: AppTexts.appSettings),
            const SizedBox(height: AppSizes.spaceBtwItems),

            //! ---> local data option
            const ProfileSettingsOption(title: AppTexts.localData, subtitle: AppTexts.localDataSubtitle, icon: Iconsax.document_upload),

            //! ---> geolocation option
            const ProfileSettingsOption(title: AppTexts.geolocation, subtitle: AppTexts.geolocationSubtitle, icon: Iconsax.location, showSwitch: true),

            //! ---> safemode option
            const ProfileSettingsOption(title: AppTexts.safeMode, subtitle: AppTexts.safeModeSettings, icon: Iconsax.location, showSwitch: true),

            //! ---> hd Image option
            const ProfileSettingsOption(title: AppTexts.hdImage, subtitle: AppTexts.hdImageSubttile, icon: Iconsax.location, showSwitch: true),

            //! ---> log out Button
            const SizedBox(height: AppSizes.spaceBtwSections),
            LogOutButton(
              onTap: () => AppPopups.showCancelConfirmAlertDialog(
                title: "LOGOUT?",
                content: "Do You Realy Want To Logout",
                onConfirm: () async => await controller.logout(),
              ),
            ),
            const SizedBox(height: AppSizes.lg),
          ],
        ),
      ),
    );
  }
}
