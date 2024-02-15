// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:recipes_app/constants.dart';
import 'package:recipes_app/functions/right_to_left_animation.dart';
import 'package:recipes_app/models/categories_model.dart';
import 'package:recipes_app/models/recipe_model.dart';
import 'package:recipes_app/screens/all_categories_screen.dart';
import 'package:recipes_app/screens/recipes_by_category_screen.dart';
import 'package:recipes_app/screens/search_screen.dart';
import 'package:recipes_app/services/db_service.dart';
import 'package:recipes_app/widgets/homescreen_categories_list.dart';
import 'package:recipes_app/widgets/drawer.dart';
import 'package:recipes_app/widgets/homescreen_buttons.dart';
import 'package:recipes_app/widgets/recipes_list.dart';

class HomeScreen extends StatelessWidget {
  final Recipe? recipe;

  const HomeScreen({
    Key? key,
    this.recipe,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Categories categories = Categories();
    return Scaffold(
      backgroundColor: Constants.greyColor,
      drawer: MainDrawer(),
      appBar: AppBar(
        title: const Text(
          'Anasayfa',
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context, rightToLeftPageAnimation(const SearchScreen()));
              },
              icon: const Icon(FontAwesomeIcons.magnifyingGlass)),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            HomePageButtons(
              text: 'Kategoriler',
              pressCallback: () {
                Navigator.push(
                  context,
                  rightToLeftPageAnimation(
                      AllCategoriesScreen(categories: categories)),
                );
              },
            ),
            const SizedBox(
              height: 140,
              child: CategoriesList(scrollDirection: Axis.horizontal),
            ),
            HomePageButtons(
              text: 'Kolay Tarifler',
              pressCallback: () {
                Navigator.push(
                  context,
                  rightToLeftPageAnimation(
                    RecipesbyCategoryScreen(
                        theMethod: DatabaseService().getKolayRecipes(),
                        selectedCategory: 'Kolay Tarifler'),
                  ),
                );
              },
            ),
            SizedBox(
              height: Constants.cardHeight,
              child: RecipesList(
                viewType: 'List',
                theMethod: DatabaseService().getKolayRecipes(),
              ),
            ),
            HomePageButtons(
              text: 'Kısa Tarifler',
              pressCallback: () {
                Navigator.push(
                  context,
                  rightToLeftPageAnimation(
                    RecipesbyCategoryScreen(
                        theMethod: DatabaseService().getKisaRecipes(),
                        selectedCategory: 'Kısa Tarifler'),
                  ),
                );
              },
            ),
            SizedBox(
              height: Constants.cardHeight,
              child: RecipesList(
                viewType: 'List',
                theMethod: DatabaseService().getKisaRecipes(),
              ),
            ),
            HomePageButtons(
              text: 'Klasik Tarifler',
              pressCallback: () {
                Navigator.push(
                  context,
                  rightToLeftPageAnimation(
                    RecipesbyCategoryScreen(
                        theMethod: DatabaseService().getKlasikRecipes(),
                        selectedCategory: 'Klasik Tarifler'),
                  ),
                );
              },
            ),
            SizedBox(
              height: Constants.cardHeight,
              child: RecipesList(
                viewType: 'List',
                theMethod: DatabaseService().getKlasikRecipes(),
              ),
            ),
            HomePageButtons(
              text: 'Çok Kişilik Tarifler',
              pressCallback: () {
                Navigator.push(
                  context,
                  rightToLeftPageAnimation(
                    RecipesbyCategoryScreen(
                        theMethod: DatabaseService().getCokKisilikRecipes(),
                        selectedCategory: 'Çok Kişilik Tarifler'),
                  ),
                );
              },
            ),
            SizedBox(
              height: Constants.cardHeight,
              child: RecipesList(
                viewType: 'List',
                theMethod: DatabaseService().getCokKisilikRecipes(),
              ),
            ),
            HomePageButtons(
              text: 'Ana Yemek Tarifleri',
              pressCallback: () {
                Navigator.push(
                  context,
                  rightToLeftPageAnimation(
                    RecipesbyCategoryScreen(
                        theMethod: DatabaseService().getAnaYemekRecipes(),
                        selectedCategory: 'Ana Yemek Tarifleri'),
                  ),
                );
              },
            ),
            SizedBox(
              height: Constants.cardHeight,
              child: RecipesList(
                viewType: 'List',
                theMethod: DatabaseService().getAnaYemekRecipes(),
              ),
            ),
            HomePageButtons(
              text: 'Aperatif Tarifler',
              pressCallback: () {
                Navigator.push(
                  context,
                  rightToLeftPageAnimation(
                    RecipesbyCategoryScreen(
                        theMethod: DatabaseService().getAperatifRecipes(),
                        selectedCategory: 'Aperatif Tarifler'),
                  ),
                );
              },
            ),
            SizedBox(
              height: Constants.cardHeight,
              child: RecipesList(
                viewType: 'List',
                theMethod: DatabaseService().getAperatifRecipes(),
              ),
            ),
            HomePageButtons(
              text: 'İçecek Tarifleri',
              pressCallback: () {
                Navigator.push(
                  context,
                  rightToLeftPageAnimation(
                    RecipesbyCategoryScreen(
                        theMethod: DatabaseService().getIcecekRecipes(),
                        selectedCategory: 'İçecek Tarifleri'),
                  ),
                );
              },
            ),
            SizedBox(
              height: Constants.cardHeight,
              child: RecipesList(
                viewType: 'List',
                theMethod: DatabaseService().getIcecekRecipes(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
