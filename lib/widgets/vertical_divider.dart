import 'package:flutter/material.dart';

class DetailsVerticalDivider extends StatelessWidget {
  const DetailsVerticalDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const VerticalDivider(
      thickness: 1,
      color: Colors.black,
      indent: 8,
      endIndent: 8,
    );
  }
}