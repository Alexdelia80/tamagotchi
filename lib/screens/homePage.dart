import 'package:flutter/material.dart';
import 'package:tamagotchi/screens/loginPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static const route = '/home/';
  static const routename = 'Homepage';

  @override
  Widget build(BuildContext context) {
    print('${HomePage.routename} built');
    return Scaffold(
      appBar: AppBar(
        title: Text(HomePage.routename),
      ),
      body: Center(
          child: Text('login_flow'),
        ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('login_flow'),
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () => _toLoginPage(context),
            ),
          ],
        ),
      ),
    );
  } //build

  void _toLoginPage(BuildContext context) async{
    //Unset the 'username' filed in SharedPreference 
    final sp = await SharedPreferences.getInstance();
    sp.remove('username');

    //Pop the drawer first 
    Navigator.pop(context);
    //Then pop the HomePage
    Navigator.of(context).pushReplacementNamed(LoginPage.route);
  }//_toCalendarPage

} //HomePage