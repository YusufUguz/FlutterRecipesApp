// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:recipes_app/models/categories_model.dart';
import 'package:recipes_app/services/db_service.dart';
import 'package:recipes_app/widgets/categories_list_item.dart';

class CategoriesList extends StatelessWidget {
  final Axis scrollDirection;

  const CategoriesList({
    Key? key,
    required this.scrollDirection,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Categories>>(
      future: DatabaseService().getAllCategories(),
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
          final categories = snapshot.data ?? [];

          return Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: ListView.builder(
              scrollDirection: scrollDirection,
              itemCount: 5,
              itemBuilder: (context, index) {
                return CategoriesListItem(categories: categories[index]);
              },
            ),
          );
        }
      },
    );
  }
}
