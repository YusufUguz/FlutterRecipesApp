// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:recipes_app/models/categories_model.dart';
import 'package:recipes_app/screens/recipes_by_category_screen.dart';
import 'package:recipes_app/services/db_service.dart';

class CategoriesListItem extends StatelessWidget {
  const CategoriesListItem({
    Key? key,
    required this.categories,
  }) : super(key: key);

  final Categories categories;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => RecipesbyCategoryScreen(
                theMethod: DatabaseService()
                    .getRecipesByCategory(categories.kategoriAd!),
                selectedCategory: categories.kategoriAd!,
              ),
            ),
          );
        },
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                width: MediaQuery.of(context).size.width * 0.5,
                height: 130,
                categories.kategoriImage!,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.black.withOpacity(0.6),
              ),
              width: MediaQuery.of(context).size.width * 0.5,
              height: 130,
            ),
            Text(
              categories.kategoriAd!,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontFamily: 'Poppins',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
