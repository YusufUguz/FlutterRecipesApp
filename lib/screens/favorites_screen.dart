// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:recipes_app/constants.dart';
import 'package:recipes_app/models/recipe_model.dart';
import 'package:recipes_app/services/db_service.dart';
import 'package:recipes_app/widgets/recipes_list.dart';

// ignore: must_be_immutable
class FavoritesScreen extends StatelessWidget {
  FavoritesScreen({
    Key? key,
    required this.selectedCategory,
    required this.theMethod,
  }) : super(key: key);

  final String selectedCategory;
  Future<List<Recipe>>? theMethod;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.greyColor,
      appBar: AppBar(
        title: Text(selectedCategory),
      ),
      body: RecipesList(
        viewType: 'Grid',
        theMethod: DatabaseService().getFavoriteRecipes(),
      ),
    );
  }
}
