import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ushop/routes/app_routs.dart';
import '../../../../common/custom_shapes/bottom_edget_clipper.dart';
import '../../../../common/widgets/bars/app_search_bar.dart';
import '../../../../common/widgets/shapes/circle.dart';
import '../../../../common/widgets/titles/custome_title.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/texts.dart';
import '../../../../utils/helpers/helper_functions.dart';
import 'home_appbar.dart';
import 'popular_categories_list_view.dart';

class EdgedHeader extends StatelessWidget {
  const EdgedHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: BottomEadgedClipper(),
      child: Container(
        color: AppColors.primary,
        child: SizedBox(
          height: 350,
          width: HelperFunctions.getScreenWidth(),
          child: Stack(
            children: [
              //! --- FIRST CIRCLE ----
              const Positioned(top: -150, right: -250, child: Circle(raduis: 200)),

              //! --- SECOND CIRCLE ----
              const Positioned(top: 100, right: -300, child: Circle(raduis: 200)),

              //! --- HEADER CONTAINER ----
              Column(
                children: [
                  //! ----  APPBAR CONTAINS (ItemsNumberCardButton , UserName and WelcomText)
                  const HomeAppBar(),

                  //! --- AppSearch Bar To Navigate To Search Page
                  AppSearchBar(onTap: () {
                    Get.toNamed(AppRouts.storeScreen);
                  }),

                  //! --- TITLE FOR POPULAR CATEGORIES SECTION
                  const CustomeTitle(title: AppTexts.popularCategories, titleColor: AppColors.light, padding: EdgeInsets.only(left: AppSizes.md)),

                  //! --- POPULAR CATEGORIES HORIZONTAL SCROLLING LIST
                  const PopularCategoriesListView(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
