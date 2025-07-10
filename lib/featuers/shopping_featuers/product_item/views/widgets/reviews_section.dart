import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../reviews/views/screens/reviews_screen.dart';

class ReviewsSection extends StatelessWidget {
  const ReviewsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => Get.to(() => const ReviewsScreen()),
      contentPadding: EdgeInsets.zero,
      trailing: IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_forward_ios_sharp)),
      title: Text(
        "Reviews (115)",
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }
}
