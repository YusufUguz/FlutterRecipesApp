// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:recipes_app/functions/right_to_left_animation.dart';
import 'package:recipes_app/models/categories_model.dart';
import 'package:recipes_app/screens/all_categories_screen.dart';
import 'package:recipes_app/screens/favorites_screen.dart';
import 'package:recipes_app/screens/home_screen.dart';
import 'package:recipes_app/services/db_service.dart';
import 'package:recipes_app/widgets/drawer_item_listtile.dart';

class MainDrawer extends StatelessWidget {
  MainDrawer({super.key});

  Categories categories = Categories();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.7,
      child: Drawer(
        surfaceTintColor: Colors.black,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFFFFC0CB),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    height: 80,
                    width: 80,
                    image: AssetImage('assets/images/cookbook.png'),
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    DrawerItemsListTile(
                        onTap: () {
                          Navigator.push(context,
                              rightToLeftPageAnimation(const HomeScreen()));
                        },
                        icon: const Icon(
                            color: Colors.red, FontAwesomeIcons.house),
                        listTileText: 'Anasayfa'),
                    DrawerItemsListTile(
                        listTileText: 'Kategoriler',
                        icon: const Icon(
                          FontAwesomeIcons.bars,
                          color: Colors.red,
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              rightToLeftPageAnimation(
                                  AllCategoriesScreen(categories: categories)));
                        }),
                    DrawerItemsListTile(
                        onTap: () {
                          Navigator.push(
                            context,
                            rightToLeftPageAnimation(
                              FavoritesScreen(
                                  selectedCategory: 'Favori Tarifler',
                                  theMethod:
                                      DatabaseService().getFavoriteRecipes()),
                            ),
                          );
                        },
                        icon: const Icon(
                            color: Colors.red, FontAwesomeIcons.heart),
                        listTileText: 'Favoriler'),
                    DrawerItemsListTile(
                        listTileText: "Bize Ulaşın",
                        icon: const Icon(
                          FontAwesomeIcons.envelope,
                          color: Colors.red,
                        ),
                        onTap: () {}),
                    DrawerItemsListTile(
                        listTileText: "Hakkımızda",
                        icon: const Icon(
                          FontAwesomeIcons.circleInfo,
                          color: Colors.red,
                        ),
                        onTap: () {}),
                  ],
                ),
                const SizedBox(
                  height: 80,
                ),
                Image.asset(
                  'assets/images/brandingSplashScreen2.png',
                  width: 120,
                  height: 85,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
