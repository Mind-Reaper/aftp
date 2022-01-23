import 'package:aftp/main.dart';
import 'package:aftp/pages/dashboard.dart';
import 'package:aftp/pages/notification.dart';
import 'package:aftp/pages/schedule.dart';
import 'package:aftp/pages/search.dart';
import 'package:aftp/providers/state_provider.dart';
import 'package:aftp/widgets/app_bar.dart';
import 'package:aftp/widgets/keep_alive.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Widget> indicator = [
    Expanded(
      child: Align(
        alignment: Alignment.centerLeft,
        child: Image(
          image: AssetImage('assets/images/active.png'),
        ),
      ),
    ),
    Spacer(),
    Spacer(),
    Spacer(),
  ];

  @override
  Widget build(BuildContext context) {
    //define state_provider instance
    var stateProvider = Provider.of<StateProvider>(context);
    return Background(
      child: Scaffold(
        body: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: stateProvider.pageController,
          children: [
            KeepAlivePage(child: DashBoard()),
            KeepAlivePage(child: Schedule()),
            //container fills in space for the middle button
            // Container(),
            KeepAlivePage(child: Notifications()),
            KeepAlivePage(child: Search()),
          ],
        ),
        backgroundColor: Colors.transparent,
        bottomNavigationBar: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            BottomNavigationBar(
              currentIndex: stateProvider.pageIndex,
              backgroundColor: Colors.transparent,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              elevation: 0,
              type: BottomNavigationBarType.fixed,
              enableFeedback: false,
              onTap: (index) {
                Widget item = indicator[stateProvider.pageIndex];
                indicator.removeAt(stateProvider.pageIndex);
                indicator.insert(index, item);
                setState(() {});
                stateProvider.changePage(index);
              },
              items: [
                BottomNavigationBarItem(
                    icon: Image(
                      image: AssetImage(
                          'assets/images/${stateProvider.pageIndex == 0 ? '' : 'no_'}dashboard.png'),
                      height: 20,
                      width: 20,
                    ),
                    label: 'Dashboard'),
                BottomNavigationBarItem(
                    icon: Image(
                      image: AssetImage(
                          'assets/images/${stateProvider.pageIndex == 1 ? '' : 'no_'}schedule.png'),
                      height: 20,
                    ),
                    label: 'Schedule'),
                // BottomNavigationBarItem(
                //     label: "Plus",
                //     icon: Container(
                //       height: 40,
                //       width: 40,
                //       decoration: BoxDecoration(
                //         color: Color(0xff246BFD),
                //         shape: BoxShape.circle,
                //       ),
                //       child: Icon(
                //         Icons.add_rounded,
                //         color: Colors.white,
                //         size: 14,
                //       ),
                //     )),
                BottomNavigationBarItem(
                    icon: Image(
                      image: AssetImage(
                          'assets/images/${stateProvider.pageIndex == 2 ? '' : 'no_'}notify.png'),
                      height: 20,
                    ),
                    label: 'Notification'),
                BottomNavigationBarItem(
                    icon: Image(
                      image: AssetImage('assets/images/search.png'),
                      height: 20,
                    ),
                    label: 'Search'),
              ],
            ),
            Container(
              width: double.infinity,
              height: 15,
              child: Row(mainAxisAlignment: MainAxisAlignment.start, children: indicator),
            )
          ],
        ),
      ),
    );
  }
}
