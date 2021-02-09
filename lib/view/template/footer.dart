import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Footer extends StatelessWidget {

  Footer();

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items:<BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shop),
          label: 'Shop',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shop),
          label: 'Shop',
        ),
      ],
      //currentIndex: _selectedIndex,
      selectedItemColor: Colors.amber[800],
      //onTap: _onItemTapped,
    );
  }
}