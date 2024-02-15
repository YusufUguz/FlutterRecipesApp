import 'package:flutter/material.dart';
import 'package:recipes_app/screens/recipe_screen.dart';

class RecipeScreenDetailsColumn extends StatelessWidget {
  const RecipeScreenDetailsColumn({
    Key? key,
    required this.widget,
    required this.text,
    required this.dataText,
  }) : super(key: key);

  final RecipeScreen widget;
  final String text;
  final String dataText;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          text,
          style: const TextStyle(
            fontSize: 14,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          dataText,
          style: const TextStyle(
            fontSize: 13,
            fontFamily: 'Poppins',
          ),
        ),
      ],
    );
  }
}
