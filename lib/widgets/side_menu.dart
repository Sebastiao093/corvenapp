import 'package:flutter/material.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          _DrawerHeader(),

          ListTile(
            leading: const Icon(Icons.chat),
            title: Text('Chat'),
            onTap: (){
              /* Navigator.pop(context); */
              Navigator.pushReplacementNamed(context, 'login');
            },
          ),

          /* ListTile(
            leading: const Icon(Icons.people_outline),
            title: Text('People'),
            onTap: (){
              /* Navigator.pop(context); */
              Navigator.pushReplacementNamed(context, 'login');
            },
          ),

          ListTile(
            leading: const Icon(Icons.settings_outlined),
            title: Text('Settings'),
            onTap: (){
              /* Navigator.pop(context); */
              Navigator.pushReplacementNamed(context, 'login');
            },
          ) */

      ],),
    );
  }
}

class _DrawerHeader extends StatelessWidget {
  const _DrawerHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      child: Container(),
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/facebook.png'),
          fit: BoxFit.fill),
          ),
    );
  }
}