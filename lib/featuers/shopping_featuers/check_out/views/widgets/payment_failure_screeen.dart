import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ushop/common/widgets/screens/centered_aligned_columen.dart';
import 'package:ushop/data/repositories/authentication_repository/authentication_repository.dart';

class PaymentFailureScreeen extends StatelessWidget {
  const PaymentFailureScreeen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CenteredAlignedColumn(
        action1: const Column(
          children: [
            Icon(Iconsax.close_circle, color: Colors.red, size: 100),
            Text('Payment Failed', style: TextStyle(color: Colors.red, fontSize: 20, fontWeight: FontWeight.bold)),
          ],
        ),
        action2: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  AuthenticationRepository.instance.screenRedirect();
                },
                child: const Text("Try Again")),
          ],
        ),
      ),
    );
  }
}
