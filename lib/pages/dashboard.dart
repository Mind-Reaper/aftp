import 'dart:async';

import 'package:aftp/constants.dart';
import 'package:aftp/pages/chat.dart';
import 'package:aftp/providers/state_provider.dart';
import 'package:aftp/widgets/app_bar.dart';
import 'package:aftp/widgets/cards.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../main.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  int watch = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    var stateProvider = Provider.of<StateProvider>(context, listen: false);
    Future.microtask(() => stateProvider.startTimer());
  }

  @override
  Widget build(BuildContext context) {
    var stateProvider = Provider.of<StateProvider>(context);
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Column(
          children: [
            CustomBar(
              showBack: false,
              title: 'Next Watch',
              trailing: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 30,
                    width: 30,
                    child: Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context, MaterialPageRoute(builder: (context) => Chat()));
                            },
                            child: Image(
                              image: AssetImage('assets/images/chat.png'),
                              height: 24,
                            ),
                          ),
                        ),
                        Container(
                          height: 16,
                          width: 16,
                          padding: EdgeInsets.all(2),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient:
                                  LinearGradient(colors: [Color(0xffFFB28E), Color(0xffFF7A55)])),
                          child: Center(
                              child: FittedBox(
                                  child: Text(
                            '2',
                            style: TextStyle(fontSize: 10, fontWeight: FontWeight.w700),
                          ))),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 34),
                  Container(
                    height: 48,
                    width: 48,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(colors: colorTheme[stateProvider.theme])),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image(
                        image: AssetImage('assets/images/plant.png'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          child: Text(
                            'Hello,\n${stateProvider.name}',
                            style: GoogleFonts.poppins(fontSize: 36, fontWeight: FontWeight.w600),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Text(
                          '👋',
                          style: TextStyle(fontSize: 36),
                        )
                      ],
                    ),
                    SizedBox(height: 32),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              watch = 0;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: watch == 0 ? Color(0xff246BFD) : null,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                            child: Text(
                              'Next Watch',
                              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              watch = 1;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: watch == 1 ? Color(0xff246BFD) : null,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                            child: Text(
                              'Current Watch',
                              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                        Spacer(),
                        Image(
                          height: 24,
                          image: AssetImage('assets/images/filter.png'),
                        )
                      ],
                    ),
                    SizedBox(height: 40),
                    Stack(
                      alignment: Alignment.centerRight,
                      children: [
                        Text(
                          '00:00',
                          style: TextStyle(
                              fontSize: 120,
                              fontFamily: 'Digital',
                              color: Color(0xff262626).withOpacity(0.5),
                              shadows: [
                                Shadow(
                                    color: Color(0xff031327).withOpacity(0.8),
                                    offset: Offset.zero,
                                    blurRadius: 8)
                              ]),
                        ),
                        Text(
                          watch == 1
                              ? stateProvider.nextWatch
                                  .format(context)
                                  .replaceAll(' PM', "")
                                  .replaceAll(' AM', '')
                              : stateProvider.currentWatch
                                  .format(context)
                                  .replaceAll(' PM', "")
                                  .replaceAll(' AM', ''),
                          style: TextStyle(
                              fontSize: 120,
                              fontFamily: 'Digital',
                              color: Colors.white,
                              shadows: [
                                Shadow(color: Color(0xff0078BC), offset: Offset.zero, blurRadius: 6)
                              ]),
                        )
                      ],
                    ),
                    SizedBox(height: 50),
                    DashCard(
                      title: 'MK2 Gustavo',
                      theme: 1,
                    ),
                    SizedBox(height: 16),
                    DashCard(
                      title: 'EM1 Julie',
                      theme: 2,
                    ),
                    SizedBox(height: 16),
                    DashCard(
                      title: 'MindReaper',
                      theme: 4,
                    ),
                    SizedBox(height: 16),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
