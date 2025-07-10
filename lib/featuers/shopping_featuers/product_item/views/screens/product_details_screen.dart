import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../data/controllers/products/products_controller.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import '../widgets/check_out_button.dart';
import '../widgets/colors_section.dart';
import '../widgets/description_section.dart';
import '../widgets/product_descriptions_section.dart';
import '../widgets/product_details_images_displayer.dart';
import '../widgets/product_item_bottom_bar.dart';
import '../widgets/reviews_section.dart';
import '../widgets/sizes_section.dart';
import '../widgets/variation_section.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = HelperFunctions.isDarkMode(context);
    final productController = Get.put(ProductController());
    final currentProduct = productController.currentProduct.value;

    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: HelperFunctions.getScreenHeight() - 75,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //! -----> product images displayer
                  ProductDetailsImagesDisplayer(images: currentProduct.images),

                  //! -----> product details container
                  Padding(
                    padding: const EdgeInsets.only(left: AppSizes.md, right: AppSizes.md, bottom: AppSizes.spaceBtwSections),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //! -----> product descriptions Section
                        ProductDescriptionsSection(
                          rate: 5,
                          voteNumbers: 151,
                          sale: 25,
                          firstPrice: currentProduct.price,
                          secondPrice: currentProduct.salePrice,
                          description: currentProduct.description,
                          stoke: "In Stoke",
                          brandImage: isDark ? currentProduct.brand.imageUrl : currentProduct.brand.imageUrl.replaceAll("light", "dark"),
                          brandName: currentProduct.brand.name,
                          onShareIconTap: () {},
                        ),

                        //! -----> variation section
                        VariationSection(price: currentProduct.price, salePrice: currentProduct.salePrice, description: currentProduct.description),

                        //! -----> colors section
                        const ColorsSection(),

                        //! -----> sizes section
                        const SizesSections(),

                        //! -----> check out button
                        const CheckOutButton(),

                        //! -----> description section
                        const DescriptionSection(),
                        //! -----> reviews section
                        const ReviewsSection(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          //! -----> product item bottom bar
          const ProductItemBottomBar(),
        ],
      ),
    );
  }
}
