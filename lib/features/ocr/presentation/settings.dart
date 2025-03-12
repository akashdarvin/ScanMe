import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Settings"),
      ),
      body: ListView(
        children: [

          ListTile(
            leading: Icon(Icons.brightness_6),
            title: Text("Theme"),
            onTap: () {},
          ),

          ListTile(
            leading: Icon(Icons.language),
            title: Text("Language"),
            onTap: () {},
          ),

          ListTile(
            leading: Icon(Icons.description),
            title: Text("Terms & Conditions"),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}