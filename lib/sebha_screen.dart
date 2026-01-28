import 'package:flutter/material.dart';

import 'utils.dart';

class SebhaScreen extends StatefulWidget {
  const SebhaScreen({super.key});

  @override
  State<SebhaScreen> createState() => _SebhaScreenState();
}

class _SebhaScreenState extends State<SebhaScreen> {
  int counter = 0;
  double angle = 0;
  List<String> sebhaList = ['سبحان الله', 'الحمد لله', 'الله أكبر'];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          colorFilter: ColorFilter.mode(Color(0xff151515), BlendMode.exclusion),
          opacity: .3,
          image: AssetImage('assets/Images/sebha_bg.png'),
          fit: BoxFit.fill,
          alignment: AlignmentGeometry.topCenter,
        ),
      ),
      child: Container(
        width: getWidth(context),
        height: getHeight(context),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xff202020), Colors.transparent],
            begin: AlignmentGeometry.bottomCenter,
            end: AlignmentGeometry.topCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 16,
            children: [
              Image.asset('assets/Images/img_header.png'),
              Text(
                'سَبِّحِ اسْمَ رَبِّكَ الأعلى',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 36,
                  color: textColor,
                ),
              ),

              Expanded(
                child: InkResponse(
                  onTap: () {
                    counter++;
                    setState(() {});
                  },
                  child: Stack(
                    children: [
                      Align(
                        alignment: AlignmentGeometry.topCenter,
                        child: Image.asset(
                          'assets/Images/sebha1.png',
                          scale: .9,
                        ),
                      ),
                      Center(
                        child: AnimatedRotation(
                          curve: Curves.easeInOutCirc,
                          turns: counter / 30,
                          duration: Duration(milliseconds: 250),
                          child: Image.asset('assets/Images/SebhaBody 1.png'),
                        ),
                      ),
                      Center(
                        child: Text(
                          '${sebhaList[((counter ~/ 33)) % 3]}\n$counter',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 36,
                            color: textColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
