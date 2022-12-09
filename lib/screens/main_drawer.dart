import 'package:flutter/material.dart';
import 'package:true_vault/screens/landing_screen.dart';
import 'landing_screen.dart';

class MainDrawer extends StatelessWidget {
  final String email;
  const MainDrawer({Key? key, required this.email}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            color: const Color.fromRGBO(23, 42, 58, 1.0),
            child: Center(
              child: Column(
                children: <Widget>[
                  /* Container(
                      width: 100,
                      height: 100,
                      margin: EdgeInsets.only(
                        top: 30,
                        bottom: 10,
                      ),
                      child: Column(
                        children: [
                          Icon(Icons.account_circle_rounded,
                              size: 100.0, color: Colors.white54)
                        ],
                      )), */

                  Container(
                    width: 100,
                    height: 100,
                    margin: EdgeInsets.only(
                      top: 30,
                      bottom: 10,
                    ),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage(
                            'lib/assets/deafult.jpg',
                          ),
                          fit: BoxFit.fill),
                    ),
                  ),
                  Text(
                    "NAME",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    email,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text(
              'Account',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: null,
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text(
              'Settings',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: null,
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text(
              'Logout',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const LandingScreen()));
            },
          ),
        ],
      ),
    );
  }
}
