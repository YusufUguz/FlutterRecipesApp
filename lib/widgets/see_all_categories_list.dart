// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipes_app/models/categories_model.dart';
import 'package:recipes_app/services/db_service.dart';
import 'package:recipes_app/widgets/categories_list_item.dart';

class GridCategoriesList extends StatelessWidget {
  const GridCategoriesList({super.key});

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

          return GridView.builder(
            padding: const EdgeInsets.only(right: 10),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount:
                    ScreenUtil().orientation == Orientation.portrait ? 2 : 3,
                childAspectRatio: 1.25),
            itemCount: categories.length,
            itemBuilder: (context, index) {
              return CategoriesListItem(categories: categories[index]);
            },
          );
        }
      },
    );
  }
}
