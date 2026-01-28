import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'utils.dart';

class TimeScreen extends StatefulWidget {
  const TimeScreen({super.key});

  @override
  State<TimeScreen> createState() => _TimeScreenState();
}

class _TimeScreenState extends State<TimeScreen> {
  List<String> prayersList = [
    'Fajr ',
    'Sunrise',
    'Dhuhr',
    'ASR',
    'Maghrib',
    'Isha',
  ];
  List<String> prayerTimeList = [
    '05:13',
    '06:43',
    '01:01',
    '04:38',
    '07:57',
    '09:57',
  ];
  List<String> azkarImageList = [
    'assets/Images/bell-icon 1.png',
    'assets/Images/comment-bubble-icon 1.png',
    'assets/Images/document-icon 1.png',
    'assets/Images/document-icon 2.png',
  ];
  List<String> azkarTextList = [
    'Evening Azkar',
    'Morning Azkar',
    'Waking Azkar',
    'Sleeping Azkar',
  ];
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
          image: AssetImage('assets/Images/more_bg.png'),
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
                width: getWidth(context),
                height: getHeight(context) * 0.32,
                decoration: BoxDecoration(
                  color: Color(0xff856B3F),
                  borderRadius: BorderRadius.all(Radius.circular(40)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            top: getHeight(context) * .015,
                            left: getWidth(context) * .06,
                          ),
                          child: Text(
                            '16 Jul,\n2024',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: textColor,
                            ),
                          ),
                        ),
                        CustomPaint(
                          painter: TimeWidgetPainter(
                            topRadius: 20,
                            bottomRadius: 35,
                            color: mainColor,
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: getWidth(context) * .08,
                              vertical: 4,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Pray Time',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xB5202020),
                                  ),
                                ),
                                Text(
                                  'Tuesday',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xE5202020),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: getHeight(context) * .015,
                            right: getWidth(context) * .06,
                          ),
                          child: Text(
                            '09 Muh,\n1446',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: textColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: getHeight(context) * 0.0268,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(40)),
                          color: mainColor,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          spacing: getHeight(context) * .019,
                          children: [
                            Expanded(
                              child: CarouselSlider.builder(
                                options: CarouselOptions(
                                  //enlargeCenterPage: true,
                                  enableInfiniteScroll: true,
                                  viewportFraction: 0.3,
                                  enlargeFactor: 0.25,
                                  //padEnds: true,
                                  //disableCenter: true,
                                  //height: getHeight(context) * 0.137339056,
                                  aspectRatio: 128 / 104,
                                  pageSnapping: true,
                                ),
                                itemCount: 5,
                                itemBuilder: (context, index, i) => TimeCard(
                                  prayer: prayersList[index],
                                  prayerTime: prayerTimeList[index],
                                  pm: !(index == 0 || index == 1),
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Spacer(),
                                Text(
                                  'Next Pray',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Color(0xBF202020),
                                  ),
                                ),
                                Text(
                                  '02:32',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: secColor,
                                  ),
                                ),
                                Expanded(
                                  child: Align(
                                    alignment: AlignmentGeometry.centerRight,
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                        right: getWidth(context) * 0.076744186,
                                      ),
                                      child: Icon(Icons.volume_off_rounded),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: AlignmentGeometry.centerLeft,
                child: Text(
                  'Azkar',
                  style: TextStyle(
                    color: textColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    childAspectRatio: 185 / 259,
                  ),

                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return AzkarCard(
                      imagePath: azkarImageList[index],
                      text: azkarTextList[index],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TimeWidgetPainter extends CustomPainter {
  /*
  * References:
  * https://stackoverflow.com/questions/77402440/create-custom-shape-in-flutter
  * https://api.flutter.dev/flutter/rendering/CustomPainter-class.html
  */
  const TimeWidgetPainter({
    required this.topRadius,
    required this.bottomRadius,
    required this.color,
  });

  final double topRadius;
  final double bottomRadius;
  final Color color;
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;
    final path = Path()
      // top right corner
      ..lineTo(size.width - topRadius, 0)
      // Top-right corner
      ..arcToPoint(
        Offset(size.width, topRadius),
        radius: Radius.circular(topRadius),
      )
      // bottom right corner
      ..lineTo(size.width, size.height - bottomRadius)
      // Bottom-right corner
      ..arcToPoint(
        Offset(size.width + bottomRadius, size.height),
        radius: Radius.circular(bottomRadius),
        clockwise: false,
      )
      // Bottom left corner
      ..lineTo(-bottomRadius, size.height)
      // Bottom-left corner
      ..arcToPoint(
        Offset(0, size.height - bottomRadius),
        radius: Radius.circular(bottomRadius),
        clockwise: false,
      )
      // Left side
      ..lineTo(0, topRadius)
      ..arcToPoint(Offset(topRadius, 0), radius: Radius.circular(topRadius));

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class TimeCard extends StatelessWidget {
  final String prayer;
  final String prayerTime;
  final bool pm;
  const TimeCard({
    super.key,
    required this.prayer,
    required this.prayerTime,
    required this.pm,
  });

  @override
  Widget build(BuildContext context) {
    final TextStyle style = TextStyle(
      color: textColor,
      fontWeight: FontWeight.bold,
      fontSize: 16,
    );
    return Container(
      width: getWidth(context) * 0.25,
      padding: EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        gradient: LinearGradient(
          colors: [Color(0xff202020), Color(0xffB19768)],
          begin: AlignmentGeometry.topLeft,
          end: AlignmentGeometry.bottomRight,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(child: Text(prayer, style: style)),
          Flexible(
            child: Text(prayerTime, style: style.copyWith(fontSize: 32)),
          ),
          Flexible(child: Text(pm ? 'PM' : 'AM', style: style)),
        ],
      ),
    );
  }
}

class AzkarCard extends StatelessWidget {
  final String imagePath;
  final String text;
  const AzkarCard({super.key, required this.imagePath, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      //width: getWidth(context) * 0.430232558,
      //height: getHeight(context) * 0.3,
      padding: EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        border: BoxBorder.all(color: mainColor, width: 1),
        color: Color(0xff202020),
      ),
      child: Column(
        children: [
          Expanded(child: Image.asset(imagePath)),
          Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }
}
