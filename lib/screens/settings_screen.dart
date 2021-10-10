import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class SettingsScreen extends StatefulWidget {
  static const routeName = '/settings';

  final Function updateFilters;
  final Map<String, bool> filters;
  SettingsScreen(this.updateFilters, this.filters);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool initialized = false;
  bool _isGlutenFree = false;
  bool _isLactoseFree = false;
  bool _isVegetarian = false;
  bool _isVegan = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!initialized) {
      _isGlutenFree = widget.filters['gluten'];
      _isLactoseFree = widget.filters['lactose'];
      _isVegetarian = widget.filters['vegetarian'];
      _isVegan = widget.filters['vegan'];
      initialized = true;
    }
  }

  Widget _buildSwitchListTile(
      bool value, String title, String subtitle, tapHandler) {
    return SwitchListTile(
      value: value,
      title: Text(
        title,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(fontSize: 18),
      ),
      onChanged: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      drawer: MainDrawer(),
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'Set your filters :)',
              style: Theme.of(context).textTheme.headline6,
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  _buildSwitchListTile(
                    _isGlutenFree,
                    'Gluten-free',
                    'Only show Gluten-free meals',
                    (value) {
                      setState(() => _isGlutenFree = value);
                    },
                  ),
                  _buildSwitchListTile(
                    _isLactoseFree,
                    'Lactose-free',
                    'Only show Lactose-free meals',
                    (value) {
                      setState(() => _isLactoseFree = value);
                    },
                  ),
                  _buildSwitchListTile(
                    _isVegetarian,
                    'Vegetarian',
                    'Only show Vegetarian meals',
                    (value) {
                      setState(() => _isVegetarian = value);
                    },
                  ),
                  _buildSwitchListTile(
                    _isVegan,
                    'Vegan',
                    'Only show Vegan meals',
                    (value) {
                      setState(() => _isVegan = value);
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          widget.updateFilters(
            {
              'gluten': _isGlutenFree,
              'lactose': _isLactoseFree,
              'vegetarian': _isVegetarian,
              'vegan': _isVegan
            },
          );
        },
        child: Icon(Icons.save),
      ),
    );
  }
}
