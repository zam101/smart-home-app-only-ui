import 'package:flutter/material.dart';
import 'package:smarthome/constants.dart';
import 'package:smarthome/pages/history_page.dart';
import 'package:smarthome/pages/home_page.dart';
import 'package:smarthome/pages/profile.dart';
import 'package:smarthome/pages/settings_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:MainPage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        primaryColorLight: primaryColor,
        useMaterial3: true,
        scaffoldBackgroundColor: scaffoldColor,
      ),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedIndex = 0;
  List<Widget> pages = [HomePage(),HistoryPage(),SettingsPage(),ProfilePage()];
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body:pages[selectedIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: (index){
          setState(() {
            selectedIndex = index;
          });
        },
        height:60,
        backgroundColor: secondaryBgColor,
        destinations: [
          NavigationDestination(
            icon: Icon(Icons.home_outlined,color:selectedIndex == 0? Colors.white :Colors.grey),
            label: "",
          ),
          NavigationDestination(
            icon: Icon(Icons.timer_outlined,color:selectedIndex == 1? Colors.white :Colors.grey),
            label: ""
          ),
          NavigationDestination(
            icon: Icon(Icons.settings,color:selectedIndex == 2? Colors.white :Colors.grey),
            label: ""
          ),
          NavigationDestination(
            icon: Icon(Icons.face,color:selectedIndex == 3? Colors.white :Colors.grey),
            label: ""
          ),
        ]

      ),

    );
  }
}
