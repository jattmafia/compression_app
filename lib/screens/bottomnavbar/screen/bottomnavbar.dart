
import 'package:compressionapp/screens/convert/convertscreen/convertscreen.dart';
import 'package:compressionapp/screens/dashboard/dashboardscreen.dart';
import 'package:compressionapp/screens/setting/screen/setting_screen.dart';
import 'package:compressionapp/utils/appcolors/appcolors.dart';
import 'package:flutter/material.dart';

class BottomNavigationScreen extends StatefulWidget {  
  
  @override  
  _BottomNavigationScreenState createState() => _BottomNavigationScreenState();  
}  
  
class _BottomNavigationScreenState extends State<BottomNavigationScreen > {  
 int _selectedIndex = 0;

  List<Widget> _widgetOptions = <Widget>[
   DashboardScreen(),
   SettingScreen()
  ];

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      backgroundColor:AppColors().BackgroundColour,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors().BackgroundColour,
        currentIndex: _selectedIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color:AppColors().TextColour,
              size: 30,
            ),
            label: '',
            activeIcon: Icon(
               Icons.home,
              color: AppColors().ButtonColour,
              size: 30,
            ),
          ),
         
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings,
              color:AppColors().TextColour,
              size: 30,
            ),
            label:'',
            activeIcon: Icon(
             Icons.settings,
              color:AppColors().ButtonColour,
              size:30,
            ),
          ),
        ],
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
    );
  }

}