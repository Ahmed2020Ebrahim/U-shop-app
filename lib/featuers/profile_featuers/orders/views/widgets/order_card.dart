import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:ushop/data/models/order/order_model.dart';
import '../../../../../common/widgets/containers/rounded_container.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/texts.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({
    super.key,
    required this.order,
  });
  final OrderModel order;

  @override
  Widget build(BuildContext context) {
    bool isDark = HelperFunctions.isDarkMode(context);
    return RoundedContainer(
      margin: const EdgeInsets.symmetric(horizontal: AppSizes.sm, vertical: AppSizes.sm),
      height: null,
      width: HelperFunctions.getScreenWidth(),
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.md),
      decoration: BoxDecoration(
        color: isDark ? Colors.transparent : AppColors.softGrey,
        border: Border.all(color: AppColors.grey),
        borderRadius: BorderRadius.circular(AppSizes.borderRadiusLg),
      ),
      child: Column(
        children: [
          ListTile(
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
            horizontalTitleGap: 4,
            contentPadding: EdgeInsets.zero,
            title: Text(
              order.orderStatus,
              style: Theme.of(context).textTheme.labelLarge!.copyWith(color: AppColors.info, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(DateFormat('dd MMM yyyy').format(order.orderDate), style: Theme.of(context).textTheme.titleMedium),
            leading: const Icon(Iconsax.ship),
          ),
          Row(
            children: [
              Expanded(
                child: ListTile(
                  horizontalTitleGap: 4,
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    AppTexts.order,
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(color: AppColors.darkGrey),
                  ),
                  subtitle: Text(order.id.substring(0, 7), style: Theme.of(context).textTheme.titleMedium),
                  leading: const Icon(Iconsax.tag),
                ),
              ),
              Expanded(
                child: ListTile(
                  horizontalTitleGap: 4,
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    AppTexts.shippingDate,
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(color: AppColors.darkGrey),
                  ),
                  subtitle: Text(DateFormat('dd MMM yyyy').format(order.deliveryDate), style: Theme.of(context).textTheme.titleMedium),
                  leading: const Icon(Iconsax.calendar),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
