import 'package:flutter/material.dart';

import '../screens/settings_screen.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget _buildListTile(IconData icon, String title, Function tapHandler) {
      return ListTile(
        leading: Icon(icon),
        title: Text(
          title,
          style: Theme.of(context).textTheme.headline6,
        ),
        onTap: tapHandler,
      );
    }

    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 150,
            padding: const EdgeInsets.only(left: 10),
            color: Theme.of(context).accentColor,
            alignment: Alignment.centerLeft,
            child: Text(
              'Cookin\' up!',
              style:
                  Theme.of(context).textTheme.headline6.copyWith(fontSize: 36),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildListTile(
                  Icons.category,
                  'Categories',
                  () => Navigator.of(context).pushReplacementNamed('/'),
                ),
                _buildListTile(
                  Icons.settings,
                  'Settings',
                  () => Navigator.of(context)
                      .pushReplacementNamed(SettingsScreen.routeName),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
