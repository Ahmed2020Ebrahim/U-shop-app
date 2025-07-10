import 'package:flutter/material.dart';
import '../../../../../common/widgets/indecators/stars_reating_indecator.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';

class RatingPost extends StatelessWidget {
  const RatingPost({
    super.key,
    this.userImageUrl,
    this.userName,
    this.rate,
    this.postDate,
    this.postText,
  });

  final String? userImageUrl;
  final String? userName;
  final double? rate;
  final String? postDate;
  final String? postText;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: AppSizes.spaceBtwItems),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            contentPadding: EdgeInsets.zero,
            horizontalTitleGap: 5,
            leading: CircleAvatar(
              radius: 20,
              backgroundImage: userImageUrl != null ? AssetImage(userImageUrl!) : null,
              backgroundColor: userImageUrl != null ? Colors.transparent : AppColors.darkGrey,
            ),
            title: Text(userName != null ? userName! : "Unknown User", style: Theme.of(context).textTheme.bodyMedium),
            trailing: PopupMenuButton(padding: EdgeInsets.zero, itemBuilder: (context) => []),
          ),
          Row(
            children: [
              if (rate != null) StarsRatingIndicator(rating: rate!),
              const SizedBox(width: AppSizes.sm),
              Text(postDate != null ? postDate! : "", style: Theme.of(context).textTheme.labelLarge),
            ],
          ),
          Container(
            padding: const EdgeInsets.all(AppSizes.sm),
            width: double.infinity,
            constraints: BoxConstraints.tight(const Size(double.infinity, 100)),
            child: SingleChildScrollView(child: Text(postText!)),
          ),
          const SizedBox(height: AppSizes.sm),
          Container(
            padding: const EdgeInsets.all(AppSizes.md),
            decoration: const BoxDecoration(
              color: AppColors.darkGrey,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("U-Shop Store"),
                    Text("21-Aug-2023"),
                  ],
                ),
                const SizedBox(height: AppSizes.sm),
                Container(
                  width: double.infinity,
                  constraints: BoxConstraints.tight(const Size(double.infinity, 50)),
                  child: const SingleChildScrollView(child: Text("Thank you for this beautiful words , i hope you to send your opinion about the new virsion of our app that will help us alot")),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
