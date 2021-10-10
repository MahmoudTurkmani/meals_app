import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const String routeName = '/meal-detail';
  final Function toggleFavorite;
  final Function isFavorite;

  MealDetailScreen(this.toggleFavorite, this.isFavorite);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final String id = ModalRoute.of(context).settings.arguments;
    Meal currentMeal = DUMMY_MEALS.firstWhere((element) => element.id == id);
    return Scaffold(
      appBar: AppBar(
        title: Text('${currentMeal.title}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.network(
              currentMeal.imageUrl,
              height: mediaQuery.size.height * 0.4,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 5),
            Text(
              'Ingredients',
              style: Theme.of(context).textTheme.headline6,
            ),
            SizedBox(height: 5),
            Container(
              width: mediaQuery.size.width * 0.8,
              height: 160,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.black),
              ),
              child: ListView.builder(
                itemCount: currentMeal.ingredients.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Theme.of(context).accentColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(currentMeal.ingredients[index]),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 5),
            Text(
              'Steps',
              style: Theme.of(context).textTheme.headline6,
            ),
            SizedBox(height: 5),
            Container(
              width: mediaQuery.size.width * 0.8,
              height: 160,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.black),
              ),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return ListView.builder(
                    itemCount: currentMeal.steps.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: <Widget>[
                          ListTile(
                            leading: CircleAvatar(
                              backgroundColor: Theme.of(context).primaryColor,
                              child: Text(
                                '#${index + 1}',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2
                                    .copyWith(fontWeight: FontWeight.normal),
                              ),
                            ),
                            title: Text('${currentMeal.steps[index]}'),
                          ),
                          Container(
                            width: constraints.maxWidth * 0.9,
                            child: Divider(color: Colors.black),
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ),
            SizedBox(height: 5),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => toggleFavorite(id),
        child: Icon(isFavorite(id) ? Icons.star : Icons.star_border),
      ),
    );
  }
}
