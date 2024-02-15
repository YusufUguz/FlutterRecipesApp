// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:recipes_app/models/categories_model.dart';
import 'package:recipes_app/widgets/see_all_categories_list.dart';

class AllCategoriesScreen extends StatelessWidget {
  final Categories categories;
  const AllCategoriesScreen({
    Key? key,
    required this.categories,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Kategoriler',
        ),
      ),
      body: const GridCategoriesList(),
    );
  }
}
