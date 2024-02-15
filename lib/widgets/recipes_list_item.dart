// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:recipes_app/functions/right_to_left_animation.dart';
import 'package:recipes_app/models/recipe_model.dart';
import 'package:recipes_app/screens/recipe_screen.dart';

// ignore: must_be_immutable
class RecipeListItem extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const RecipeListItem({
    Key? key,
    required this.recipe,
    required this.cardWidth,
    required this.iconSize,
    required this.textSize,
  }) : super(key: key);

  final Recipe recipe;
  final double cardWidth;
  final double iconSize;
  final double textSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, left: 5, bottom: 5),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            rightToLeftPageAnimation(
              RecipeScreen(recipe: recipe),
            ),
          );
        },
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: SizedBox(
            width: 200,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                    child: Image.asset(
                      recipe.mainImage!,
                      height: 120,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            FontAwesomeIcons.bowlFood,
                            color: const Color(0xFFd97676),
                            size: iconSize,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Expanded(
                            child: AutoSizeText(
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              recipe.yemekIsim!,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: textSize,
                                fontFamily: 'Poppins',
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            FontAwesomeIcons.clock,
                            color: const Color(0xFFd97676),
                            size: iconSize,
                          ),
                          Expanded(
                            child: AutoSizeText(
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              " ${recipe.yapilisSuresi.toString()} dakika",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: textSize,
                                fontFamily: 'Poppins',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
