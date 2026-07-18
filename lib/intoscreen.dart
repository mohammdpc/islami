import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

import 'utils.dart';

class IntoScreen extends StatefulWidget {
  final Widget home;
  const IntoScreen({super.key, required this.home});

  @override
  State<IntoScreen> createState() => _IntoScreenState();
}

class _IntoScreenState extends State<IntoScreen> {
  PageDecoration globalPageDecoration = PageDecoration(
    bodyFlex: 4,
    contentMargin: EdgeInsets.zero,
    bodyAlignment: Alignment.center,
  );
  TextStyle introTextStyle = TextStyle(
    color: mainColor,
    fontWeight: FontWeight.bold,
    fontSize: 24,
  );

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      globalBackgroundColor: darkGray,
      showBackButton: true,
      curve: Curves.easeInOutCirc,
      dotsDecorator: DotsDecorator(
        activeColor: mainColor,
        activeSize: Size(20, 9),
        activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      ),
      globalHeader: Image.asset('assets/Images/img_header.png'),
      
      next: Text('Next',style: introTextStyle,),
      back: Text('Back',style: introTextStyle,),
      done: Text('Finish',style: introTextStyle,),
      onDone: (){Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>widget.home));},
      pages: [
        PageViewModel(
          decoration: globalPageDecoration,
          bodyWidget: Align(
            heightFactor: 1.23,
            alignment: AlignmentGeometry.bottomCenter,
            child: Image.asset('assets/Images/WelcomText.png',),
          ),
          title: '',
          footer: Center(
            child: Text('Welcome To Islmi App', style: introTextStyle),
          ),
        ),

        PageViewModel(
          decoration: globalPageDecoration,
          bodyWidget: Align(
            heightFactor: 1.23,
            alignment: AlignmentGeometry.bottomCenter,
            child: Image.asset('assets/Images/welcomImage.png',),
          ),
          title: '',
          footer: Column(
            spacing: getHeight(context) * .03,
            children: [
              Expanded(child: Text('Welcome To Islmi App', style: introTextStyle)),
              Expanded(child: Text('We Are Very Excited To Have You In Our Community',style: introTextStyle.copyWith(fontSize: 20),textAlign: TextAlign.center,))
            ],
          ),
        ),

        PageViewModel(
          decoration: globalPageDecoration,
          bodyWidget: Align(
            heightFactor: 1.23,
            alignment: AlignmentGeometry.bottomCenter,
            child: Image.asset('assets/Images/Reading the Quran.png',),
          ),
          title: '',
          footer: Column(
            spacing: getHeight(context) * .03,
            children: [
              Expanded(child: Text('Reading the Quran', style: introTextStyle)),
              Expanded(child: Text('Read, and your Lord is the Most Generous',style: introTextStyle.copyWith(fontSize: 20),textAlign: TextAlign.center,))
            ],
          ),
        ),

        PageViewModel(
          decoration: globalPageDecoration,
          bodyWidget: Align(
            heightFactor: 1.23,
            alignment: AlignmentGeometry.bottomCenter,
            child: Image.asset('assets/Images/Bearish.png',),
          ),
          title: '',
          footer: Column(
            spacing: getHeight(context) * .03,
            children: [
              Expanded(child: Text('Bearish', style: introTextStyle)),
              Expanded(child: Text('Praise the name of your Lord, the Most High',style: introTextStyle.copyWith(fontSize: 20),textAlign: TextAlign.center,))
            ],
          ),
        ),

        PageViewModel(
          decoration: globalPageDecoration,
          bodyWidget: Align(
            heightFactor: 1.23,
            alignment: AlignmentGeometry.bottomCenter,
            child: Image.asset('assets/Images/Holy Quran Radio.png',),
          ),
          title: '',
          footer: Column(
            spacing: getHeight(context) * .03,
            children: [
              Expanded(child: Text('Holy Quran Radio', style: introTextStyle)),
              Expanded(child: Text('You can listen to the Holy Quran Radio through the application for free and easily',style: introTextStyle.copyWith(fontSize: 20),textAlign: TextAlign.center,))
            ],
          ),
        ),
      ],
    );
  }
}
