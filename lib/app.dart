import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'home.dart';
import 'notification.dart';

class MyHomePage extends StatefulWidget {
  final String title;
  final String payload;
  const MyHomePage({Key? key, required this.title,required this.payload}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  static  final List<Widget> _widgetOptions = <Widget>[
    Home(),
    NotificationPage(payload: payload,),
    Text('Profile Page', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
  ];

  static var payload;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
     // appBar: AppBar(title: Text('Notification'),),
      bottomNavigationBar: BottomNavigationBar(
        items:  <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(

            icon: Stack(

              children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(5.0, 5.0, 10.0, 0.0),
                  child: Icon(Icons.notifications,),
                ),
                Positioned(
                  top: 2,
                  right: 3,
                  child: Badge(
                  badgeContent: const Text(
                    '0',
                    style: TextStyle(color: Colors.white, fontSize: 10),
                  ),
                  badgeColor: Colors.red,
                ),)

              ],
            ),
            label: 'Notification'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      body: Center(
        child:   _widgetOptions.elementAt(_selectedIndex),
      )


    );
  }
}


