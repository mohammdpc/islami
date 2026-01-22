import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'quranscreen.dart';
import 'hadeith.dart';

import 'islami_provider.dart';
import 'theme.dart';
void main() {
  
  runApp(Provider(create:(_)=>IslamiProvider(),
  child: const MyApp(),
  ));
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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: [QuranScreen(),HadeithScreen(),Placeholder(),Placeholder(),Placeholder(),Placeholder(),][currentPageIndex],
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
