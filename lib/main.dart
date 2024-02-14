import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
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
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: secondaryColor
    ));
    return MaterialApp(
      home:const MainPage(),
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
  List<Widget> pages = [const HomePage(),const HistoryPage(),const SettingsPage(),const ProfilePage()];
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body:pages[selectedIndex],
      bottomNavigationBar:Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              tabBorderRadius: 10,
              rippleColor: Colors.grey[300]!,
              hoverColor: Colors.grey[100]!,
              gap: 8,
              activeColor: Colors.white,
              iconSize: 24,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: const Duration(milliseconds: 400),
              tabBackgroundColor: primaryColor,
              color: secondaryTextColor,
              tabs: const [
                GButton(
                  icon:Icons.home_outlined ,
                  //text: 'Home',
                ),
                GButton(
                  icon: Icons.timer_outlined,
                  //text: 'Likes',
                ),
                GButton(
                  icon: Icons.settings_outlined,
                  //text: 'Search',
                ),
                GButton(
                  icon: Icons.person_outline,
                  //text: 'Profile',
                ),
              ],
              selectedIndex: selectedIndex,
              onTabChange: (index) {
                setState(() {
                  selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ),

    );
  }
}
