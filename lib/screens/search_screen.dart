import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:recipes_app/constants.dart';
import 'package:recipes_app/models/recipe_model.dart';
import 'package:recipes_app/services/db_service.dart';
import 'package:recipes_app/widgets/recipes_list_item.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Recipe> searchResults = [];
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.greyColor,
      appBar: AppBar(
        title: const Text(
          "Tarif Ara",
        ),
      ),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: TextField(
            onChanged: (value) async {
              String searchText = searchController.text.trim();
              if (searchText.isNotEmpty) {
                List<Recipe> results =
                    await DatabaseService().searchRecipes(searchText);
                setState(() {
                  searchResults = results;
                });
              } else {
                setState(() {
                  searchResults.clear();
                });
              }
            },
            cursorColor: const Color(0xFF321432),
            controller: searchController,
            decoration: InputDecoration(
                labelText: 'Tarif Ara..',
                labelStyle: const TextStyle(
                    fontFamily: 'Poppins', color: Constants.darkPurpleColor),
                suffixIcon: IconButton(
                  onPressed: () async {
                    String searchText = searchController.text.trim();
                    if (searchText.isNotEmpty) {
                      List<Recipe> results =
                          await DatabaseService().searchRecipes(searchText);
                      setState(() {
                        searchResults = results;
                      });
                    }
                  },
                  icon: const Icon(
                    FontAwesomeIcons.magnifyingGlass,
                    color: Color(0xFF321432),
                  ),
                ),
                border: const OutlineInputBorder(
                    borderSide: BorderSide(color: Constants.darkPurpleColor),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                enabledBorder: Constants().textfieldBorder,
                focusedBorder: Constants().textfieldBorder),
          ),
        ),
        Expanded(
          child: (searchResults.isEmpty && searchController.text.isNotEmpty)
              ? const Center(
                  child: Text(
                    'Aradığınız Tarif Bulunamadı.Kontrol ederek tekrar deneyiniz.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18, fontFamily: 'Poppins'),
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.only(right: 5.0),
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 0.8, crossAxisCount: 2),
                    itemCount: searchResults.length,
                    itemBuilder: (context, index) {
                      Recipe recipe = searchResults[index];
                      return RecipeListItem(
                          recipe: recipe,
                          cardWidth: MediaQuery.of(context).size.width,
                          iconSize: 18,
                          textSize: 13);
                    },
                  ),
                ),
        ),
      ]),
    );
  }
}
