// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipes_app/constants.dart';
import 'package:recipes_app/models/recipe_model.dart';
import 'package:recipes_app/widgets/recipes_list_item.dart';

// ignore: must_be_immutable
class RecipesList extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  RecipesList({
    Key? key,
    this.theMethod,
    required this.viewType,
  }) : super(key: key);

  Future<List<Recipe>>? theMethod;
  final String viewType;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Recipe>>(
      future: theMethod,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Veriler alınırken bir hata oluştu: ${snapshot.error}'),
          );
        } else {
          final recipes = snapshot.data ?? [];

          if (viewType == 'List') {
            return Padding(
              padding: const EdgeInsets.only(right: 10),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: recipes.length,
                itemBuilder: (context, index) {
                  return RecipeListItem(
                    textSize: Constants.calculateFontSize(42),
                    iconSize: MediaQuery.of(context).size.width * 0.05,
                    cardWidth: MediaQuery.of(context).size.width * 0.5,
                    recipe: recipes[index],
                  );
                },
              ),
            );
          } else if (viewType == 'Grid') {
            return GridView.builder(
              padding: const EdgeInsets.only(right: 5),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount:
                      ScreenUtil().orientation == Orientation.portrait ? 2 : 3,
                  childAspectRatio: 0.78),
              itemCount: recipes.length,
              itemBuilder: (context, index) {
                return RecipeListItem(
                  textSize: Constants.calculateFontSize(40),
                  iconSize: MediaQuery.of(context).size.width * 0.05,
                  cardWidth: MediaQuery.of(context).size.width,
                  recipe: recipes[index],
                );
              },
            );
          } else {
            return const Text('Geçersiz Görüntüleme Tipi');
          }
        }
      },
    );
  }
}
