import 'package:flutter/material.dart';

class VerticalSpacedScreen extends StatelessWidget {
  const VerticalSpacedScreen({
    required this.children,
    required this.spaces,
    super.key,
  }) : assert(children.length == spaces.length + 1, "spaces length must be equal to cheildren legnth - 1");

  final List<Widget> children;
  final List<double> spaces;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        children.length,
        (index) => Column(
          children: [
            children[index],
            SizedBox(
              height: index == children.length - 1 ? 0 : spaces[index],
            ),
          ],
        ),
      ),
    ));
  }
}
