import 'package:flutter/material.dart';

import 'utils.dart';

class RadioScreen extends StatefulWidget {
  const RadioScreen({super.key});

  @override
  State<RadioScreen> createState() => _RadioScreenState();
}

class _RadioScreenState extends State<RadioScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: getWidth(context),
      padding: EdgeInsetsGeometry.symmetric(
        horizontal: widthRatio(context, 20),
      ),
      decoration: BoxDecoration(
        image: DecorationImage(
          colorFilter: ColorFilter.mode(Color(0xff151515), BlendMode.exclusion),
          opacity: .3,
          image: AssetImage('assets/Images/radio_bg.png'),
          fit: BoxFit.fill,
          alignment: AlignmentGeometry.center,
        ),
      ),
      child: SafeArea(
        child: DefaultTabController(
          length: 2,
          child: Column(
            spacing: getHeight(context) * .017,
            children: [
              Image.asset('assets/Images/img_header.png'),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: fadedGray,
                ),
                child: TabBar(
                  dividerHeight: 0,
                  overlayColor: WidgetStatePropertyAll(secColor),
                  labelStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: secColor,
                  ),

                  unselectedLabelStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: textColor,
                  ),
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: mainColor,
                  ),
                  indicatorSize: TabBarIndicatorSize.tab,
                  tabs: [
                    Tab(text: 'Radio'),
                    Tab(text: 'Reciters'),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    ListView.separated(
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return RadioCard();
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(height: getHeight(context) * .017);
                      },
                    ),
                    RadioCard(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RadioCard extends StatefulWidget {
  const RadioCard({super.key});

  @override
  State<RadioCard> createState() => _RadioCardState();
}

class _RadioCardState extends State<RadioCard> {
  bool sound = true;
  bool play = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: getHeight(context) * 0.14,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: mainColor,
        image: DecorationImage(
          image: AssetImage(
            play
                ? 'assets/Images/soundWave 1.png'
                : 'assets/Images/RadioBackground.png',
          ),
          alignment: AlignmentGeometry.bottomCenter,
        ),
      ),
      child: Column(
        children: [
          Expanded(
            child: Text(
              'Radio Ibrahim Al-Akdar',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: getWidth(context) * .1),
              IconButton(
                onPressed: () {
                  setState(() {
                    play = !play;
                  });
                },
                icon: Icon(
                  play ? Icons.pause_rounded : Icons.play_arrow_rounded,
                  size: getWidth(context) * .1,
                ),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    sound = !sound;
                  });
                },
                icon: Icon(
                  sound ? Icons.volume_up_rounded : Icons.volume_off,
                  size: getWidth(context) * .069,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
