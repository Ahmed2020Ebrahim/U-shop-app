import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../featuers/bottom_navigation_menu/views/screens/bottom_navigation_menu.dart';
import '../../../utils/constants/images.dart';
import '../../../utils/constants/texts.dart';
import 'succes_screen.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key, required this.loadWidget});

  final Widget loadWidget;

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void didChangeDependencies() async {
    await Future.delayed(const Duration(seconds: 3)).then(
      (value) => Get.to(
        () => SuccessScreen(
          mainWidget: const Image(image: AssetImage(AppImages.succesTick)),
          title: AppTexts.doneSuccessfully,
          buttonText: AppTexts.continu,
          onButtonTap: () {
            Get.to(() => const BottomNavigationMenu());
          },
        ),
      ),
    );
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: widget.loadWidget,
      ),
    );
  }
}
