import 'package:doctord/screens/cart.dart';
import 'package:doctord/screens/goodday.dart';
import 'package:doctord/screens/more.dart';
import 'package:doctord/screens/search.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

// const kMainColor = Color(0xFF573851);

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  String title = 'BottomNavigationBar';

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF3C63C7),
      body: TabBarView(
        
        children: const <Widget>[
          GoodDay(),
          Cart(),
          Search(),
          More(),
        ],
        physics: const NeverScrollableScrollPhysics(),
        controller: _tabController,
      ),
      bottomNavigationBar: SizedBox(
        child: ClipRRect(
          borderRadius: const BorderRadius.all(
            Radius.circular(40.0),
          ),
          child: Container(
            height: 72,
            color: Colors.white,
            child: TabBar(
              labelColor: const Color(0xFF3C63C8),
              // unselectedLabelColor: Colors.white,
              labelStyle: const TextStyle(fontSize: 10.0),
              
              indicator: CircleTabIndicator(color:const Color(0xFF3C63C8), radius: 5),
              //For Indicator Show and Customization
              tabs: const <Widget>[
                Tab(
                  icon: ImageIcon(
                    AssetImage(
                      "assets/images/home.png",
                    ),
                    size: 38.0,
                  ),
                ),
                Tab(
                  icon: ImageIcon(
                    AssetImage(
                      "assets/images/location.png",
                    ),
                    size: 38.0,
                  ),
                ),
                Tab(
                  icon: ImageIcon(
                    AssetImage(
                      "assets/images/search.png",
                    ),
                    size: 38.0,
                  ),
                ),
                Tab(
                  icon: ImageIcon(
                    AssetImage(
                      "assets/images/person.png",
                    ),
                    size: 38.0,
                  ),
                ),
              ],
              controller: _tabController,
            ),
          ),
        ),
      ),
    );
  }
}

class CircleTabIndicator extends Decoration {
  final BoxPainter _painter;

  CircleTabIndicator({required Color color, required double radius})
      : _painter = _CirclePainter(color, radius);

  @override
  BoxPainter createBoxPainter([void Function()? onChanged]) => _painter;
}

class _CirclePainter extends BoxPainter {
  final Paint _paint;
  final double radius;

  _CirclePainter(Color color, this.radius)
      : _paint = Paint()
          ..color = color
          ..isAntiAlias = true;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {
    final Offset circleOffset =
        offset + Offset(cfg.size!.width / 2, cfg.size!.height - radius - 5);
    canvas.drawCircle(circleOffset, radius, _paint);
  }
}
