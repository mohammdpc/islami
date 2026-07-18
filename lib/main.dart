  import 'package:flutter/material.dart';

import 'intoscreen.dart';
import 'quran_screen.dart';
import 'hadith.dart';
import 'sebha_screen.dart';
import 'radio.dart';
import 'time_screen.dart';

import 'theme.dart';
import 'utils.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  loadHadithList();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Islami',
      theme: islamiTheme,
      home: const IntoScreen(home: MyHomePage(),),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key,});



  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: [QuranScreen(),HadithScreen(),SebhaScreen(),RadioScreen(),TimeScreen(),][currentPageIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentPageIndex,
        onDestinationSelected: (pIndex) {
          setState(() {
            currentPageIndex = pIndex;
          });
        },
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        destinations: [
          NavigationDestination(
            icon: Image.asset('assets/Icons/ic_quran.png',),
            selectedIcon:  Image.asset('assets/Icons/ic_quran.png',color: Colors.white,),
            label: 'Quran',
          ),
          NavigationDestination(
            icon: Image.asset('assets/Icons/ic_hadeth.png'),
            selectedIcon: Image.asset('assets/Icons/ic_hadeth.png',color: Colors.white,),
            label: 'Hadith',
          ),
          NavigationDestination(
            icon: Image.asset('assets/Icons/ic_sebha.png'),
            selectedIcon: Image.asset('assets/Icons/ic_sebha.png',color: Colors.white,),
            label: 'Sebha',
          ),
          NavigationDestination(
            icon: Image.asset('assets/Icons/ic_radio.png'),
            selectedIcon: Image.asset('assets/Icons/ic_radio.png',color: Colors.white,),
            label: 'Radio',
          ),
          NavigationDestination(
            icon: Image.asset('assets/Icons/ic_time.png'),
            selectedIcon: Image.asset('assets/Icons/ic_time.png',color: Colors.white,),
            label: 'Time',
          ),
        ],
      ),
    );
  }
}
