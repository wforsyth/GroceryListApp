import 'package:flutter/material.dart';
import '../constants.dart';
import '../routes.dart';
import '../screens/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../authorisation/loginRegister.dart';

//Defines home screen state 
//Provides currently logged in user and sign out functionality
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();

  final User? user = Auth().currentUser;

  Future<void> signOut() async {
    await Auth().signOut();
  }

  Widget _userId() {
    return Text(user?.email ?? 'User email');
  }
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  String? _firstName;
  String? _surname;

//List of widgets used in bottom navigation bar
  final List<Widget> _screens = [
    Home(),
  ];

//Gets currently logged in users first and surname
  Future<void> _fetchUserName() async {
    Map<String, String> details = await Auth().getUserName();
    setState(() {
      _firstName = details['firstName'];
      _surname = details['surname'];
    });
  }

  void initState() {
    super.initState();
    _fetchUserName();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Collapsable side drawer to display users name and log out functionality
      drawer: Drawer(
          child: ListView(padding: EdgeInsets.zero, children: <Widget>[
        DrawerHeader(
          child: Text('$_firstName $_surname'),
          decoration: BoxDecoration(
            color: kBackgroundColor,
          ),
        ),
        SizedBox(height: 6),
        ListTile(
          title: Text('Logout'),
          onTap: () {
            widget.signOut();
            Navigator.of(context).pop();
            Navigator.pushNamed(context, AppRoutes.prelogin);
          },
        ),
      ])),
      //Cycles through widgets depending on which item is selected in bottom navigation bar
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              ),
          BottomNavigationBarItem(
              icon: Icon(Icons.book),
              label: 'Journal',
              ),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_chart_rounded),
              label: 'Analytics',
             ),
          BottomNavigationBarItem(
              icon: Icon(Icons.contact_emergency),
              label: 'Emergency Contact',
            ),
        ],
      ),
    );
  }
}