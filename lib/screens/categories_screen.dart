import 'package:flutter/material.dart';

import '../dummy_data.dart';
import '../widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        itemCount: DUMMY_CATEGORIES.length,
        itemBuilder: (ctx, index) {
          return CategoryItem(
            id: DUMMY_CATEGORIES[index].id,
            title: DUMMY_CATEGORIES[index].title,
            color: DUMMY_CATEGORIES[index].color,
          );
        },
      ),
    );
  }
}
