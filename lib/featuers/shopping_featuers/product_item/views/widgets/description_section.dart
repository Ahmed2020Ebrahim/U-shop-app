import 'package:flutter/material.dart';
import '../../../../../common/widgets/titles/custome_title.dart';
import '../../../../../utils/constants/sizes.dart';

class DescriptionSection extends StatelessWidget {
  const DescriptionSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: AppSizes.md),
        const CustomeTitle(
          title: "Description",
          padding: EdgeInsets.symmetric(horizontal: 0, vertical: AppSizes.md),
        ),
        Container(
          padding: const EdgeInsets.all(AppSizes.sm),
          width: double.infinity,
          constraints: BoxConstraints.tight(const Size(double.infinity, 100)),
          child: SingleChildScrollView(
              child: Text(
            "That is the first product of our company hope it will be good to do that, That is the first product of our company hope it will be good That is the first product of our company hope it will be good",
            style: Theme.of(context).textTheme.labelLarge,
          )),
        ),
        const Center(
          child: Divider(
            height: AppSizes.spaceBtwSections,
          ),
        ),
      ],
    );
  }
}
