import 'package:aftp/constants.dart';
import 'package:aftp/widgets/expanded_section.dart';
import 'package:aftp/widgets/schedule_list.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class Schedule extends StatefulWidget {
  const Schedule({Key? key}) : super(key: key);

  @override
  _ScheduleState createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  List<String> days = ['Nov 12', 'Nov 13', 'Nov 14', 'Nov 15'];

  int selectedDay = 0;

  ItemScrollController verticalController = ItemScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Color(0xffA06AF9),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: EdgeInsets.all(8),
                    child: ImageIcon(
                      AssetImage('assets/images/roadmap.png'),
                    ),
                  ),
                  SizedBox(
                    width: 24,
                  ),
                  Text(
                    'Weekly Schedule',
                    style: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 18),
                  ),
                  Spacer(),
                  ImageIcon(AssetImage('assets/images/fav.png'), size: 21),
                  SizedBox(
                    width: 26,
                  ),
                  Icon(
                    Icons.more_horiz_rounded,
                    size: 21,
                  )
                ],
              ),
            ),
            SizedBox(height: 44),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Container(
                height: 40,
                child: Row(
                  children: [
                    Expanded(
                      child: ScrollablePositionedList.builder(
                          scrollDirection: Axis.horizontal,
                          physics: ClampingScrollPhysics(),
                          itemScrollController: verticalController,
                          itemCount: days.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                selectedDay = index;

                                verticalController.scrollTo(
                                    index: index, duration: Duration(milliseconds: 100));
                                setState(() {});
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color:
                                      selectedDay == index ? Color(0xff246BFD) : Colors.transparent,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                padding: EdgeInsets.symmetric(horizontal: 18, vertical: 4),
                                child: Center(
                                    child: Text(
                                  days[index],
                                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
                                )),
                              ),
                            );
                          }),
                    ),
                    SizedBox(width: 20),
                    Image(
                      height: 24,
                      image: AssetImage('assets/images/filter.png'),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: [
                  ScheduleList(
                      title: '0040-0000',
                      child: Column(
                        children: [
                          ScheduleCard(),
                          ScheduleCard(
                            title: 'SN Liao',
                            subtitle: 'Sentry/Rover',
                            subtitleColor: Color(0xffA5F59C),
                          ),
                          ScheduleCard(
                            title: 'SN Long',
                            subtitle: 'Sentry/Rover',
                            subtitleColor: Color(0xffA5F59C),
                            enabled: true,
                          )
                        ],
                      )),

                  ScheduleList(
                      title: '0040-0000',
                      child: Column(
                        children: [
                          ScheduleCard(),
                          ScheduleCard(
                            title: 'SN Liao',
                            subtitle: 'Sentry/Rover',
                            subtitleColor: Color(0xffA5F59C),
                          ),
                          ScheduleCard(
                            title: 'SN Long',
                            subtitle: 'Sentry/Rover',
                            subtitleColor: Color(0xffA5F59C),
                            enabled: true,
                          )
                        ],
                      )),

                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
