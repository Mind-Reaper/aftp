import 'package:aftp/constants.dart';
import 'package:flutter/material.dart';

class ImageBox extends StatelessWidget {
  final bool online;
  final int color;
  final bool senderIsMe;

  const ImageBox({Key? key, this.online: false, this.color: 1, this.senderIsMe: false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      child: ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 32),
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          //add +1 to original item count to render sender avatar.
          itemCount: 3 + 1,
          itemBuilder: (context, index) {
            if(index == 0) {
              return  Center(
                child: Padding(
                  padding: const EdgeInsets.only(right: 18),
                  child: Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Container(
                        height: 32,
                        width: 32,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(colors: colorTheme[color])),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: senderIsMe ? Center(child: Text('ME',style: TextStyle(fontSize: 10, fontWeight: FontWeight.w700, letterSpacing: 0.4),)): Image(
                            image: AssetImage('assets/images/plant.png'),
                          ),
                        ),
                      ),
                      if (online && !senderIsMe)
                        Container(
                          height: 10,
                          width: 10,
                          decoration: BoxDecoration(
                              color: Color(0xff9ADB7F),
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.black87, width: 1.5)),
                        )
                    ],
                  ),
                ),
              );
            }

            index = index - 1;
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: Container(
                width: 158,
                height: 112,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color(0xffFFB8E0),
                          Color(0xffBE9EFF),
                          Color(0xff88C0FC),
                          Color(0xff86FF99),
                        ]),
                    borderRadius: BorderRadius.circular(25),
                    image: DecorationImage(
                        image: AssetImage('assets/images/picture$index.jpg'),
                        fit: BoxFit.cover
                    )),
              ),
            );
          }),
    );
  }
}

class SenderBox extends StatelessWidget {
  final String text;
  //for more than one message coming from the same user
  final bool streak;
  //first message in a streak
  final bool firstStreak;
  //last message in a streak ..
  final bool lastStreak;

  const SenderBox({Key? key, this.text:  'Doing well, thanks! 👋', this.streak: false, this.firstStreak: false, this.lastStreak: false}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Container(
          constraints: BoxConstraints(maxWidth: 230),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(streak && lastStreak ? 25 : streak ? 5 :25),
                  topRight: Radius.circular(streak && firstStreak ? 25 : streak ? 5 :25),
                  topLeft: Radius.circular(25)),
              color: Color(0xff246BFD)),
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 12),
          child: Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 13,
              letterSpacing: 0.2
            ),
          ),
        ),
      ),
    );
  }
}


class ReceiverBox extends StatelessWidget {
  final String text;
  final String name;
  final bool online;
  //for more than one message coming from the same user
  final bool streak;
  //first message in a streak
  final bool firstStreak;
  //last message in a streak ..
  final bool lastStreak;

  final String date;

  final int color;

  const ReceiverBox({Key? key, this.text: 'Hi man, how are you doing?', this.name: 'Vincent', this.streak: false, this.firstStreak: false, this.lastStreak: false, this.color: 1, this.online: false, this.date: "12:11 PM"}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          firstStreak  || !streak? Stack(
            alignment: Alignment.topRight,
            children: [
              Container(
                height: 32,
                width: 32,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(colors: colorTheme[color])),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image(
                    image: AssetImage('assets/images/plant.png'),
                  ),
                ),
              ),
              if (online)
                Container(
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                      color: Color(0xff9ADB7F),
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.black87, width: 1.5)),
                )
            ],
          ) : Container(width: 32,),
          SizedBox(width: 18),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if(!streak || firstStreak)  Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    name,
                    style: TextStyle(fontWeight: FontWeight.w700, letterSpacing: 0.4),
                  ),
                  SizedBox(
                    width: 32,
                  ),
                  Text(
                    date,
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 10,
                        letterSpacing: 0.4,
                        color: Color(0xff5E6272)),
                  )
                ],
              ),
              if(!streak || firstStreak)    SizedBox(height: 16),
              Container(
                constraints: BoxConstraints(maxWidth: 230),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(streak && lastStreak ? 25 : streak ? 5 :25),
                        bottomRight: Radius.circular( 25),
                        topRight: Radius.circular(25),
                        topLeft: Radius.circular( streak && firstStreak ? 25  :streak ? 5 : 25  )),
                    color: Color(0xff262A34)),
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 12),
                child: Text(
                  text,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.2,
                    fontSize: 13,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}