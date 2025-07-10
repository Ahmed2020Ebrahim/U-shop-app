import 'package:flutter/material.dart';
import '../../../../../common/widgets/bars/custom_appbar.dart';
import '../../../../../utils/constants/images.dart';
import '../../../../../utils/constants/sizes.dart';
import '../widgets/rating_post.dart';
import '../widgets/rating_summary.dart';
import '../widgets/rating_view_widget.dart';

class ReviewsScreen extends StatelessWidget {
  const ReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      //! -----> app bar
      appBar: CustomeAppBar(
        showBackArrow: true,
        title: Text("Reviews & Ratings"),
        padding: EdgeInsets.zero,
      ),

      //! -----> body
      body: SingleChildScrollView(
        padding: EdgeInsets.all(AppSizes.sm),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //! -----> page description
            Text("Reviews and Ratings are verified and are from real people how use the same type of device that you use"),

            //! -----> rating details
            RatingViewWidget(),

            //! -----> stars of rating
            RatingSummary(rating: 4.5, votsNumber: 10265),

            //! -----> rating post
            RatingPost(
              postText: "it is a great app , and it is very easy to treat with, that is my comment about this app i hope every one to use it",
              userImageUrl: AppImages.googleLogo,
              userName: "Ahmed Ibrahime",
              rate: 4.5,
              postDate: "12-Mar-2023",
            ),
            RatingPost(
              postText: "it is a great app , and it is very easy to treat with, that is my comment about this app i hope every one to use it",
              userImageUrl: AppImages.googleLogo,
              userName: "Ahmed Ibrahime",
              rate: 4.5,
              postDate: "12-Mar-2023",
            ),
          ],
        ),
      ),
    );
  }
}
