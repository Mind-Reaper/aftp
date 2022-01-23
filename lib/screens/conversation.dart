import 'package:aftp/main.dart';
import 'package:aftp/widgets/app_bar.dart';
import 'package:aftp/widgets/chat_boxes.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class Conversation extends StatefulWidget {
  final String name;
  final bool online;
  final int color;

  const Conversation({Key? key, this.name: 'Vincent', this.online: true, this.color: 1}) : super(key: key);

  @override
  _ConversationState createState() => _ConversationState();
}

class _ConversationState extends State<Conversation> {
  TextEditingController controller = TextEditingController();
  ScrollController _scrollController = ScrollController();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Background(
        child: SafeArea(
          bottom: false,
          child: Column(
            children: [
              CustomBar(
                title: widget.name,
                online: widget.online,
                trailing: Image(
                  image: AssetImage('assets/images/info.png'),
                  height: 28,
                ),
              ),
              Expanded(
                  child: ListView(

                padding: EdgeInsets.symmetric(vertical: 16),
                // keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                controller: _scrollController,
                physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                children: [
                  ReceiverBox(
                    name: widget.name,
                    online: widget.online,
                    color: widget.color,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  SenderBox(streak: true, firstStreak: true,),
                  SizedBox(
                    height: 8,
                  ),
                  ImageBox(
                    online: true,
                    color: 6,
                    senderIsMe: true,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  SenderBox(text: 'Here are the images', streak: true, lastStreak: true,),
                  SizedBox(
                    height: 16,
                  ),
                  ReceiverBox(
                    name: widget.name,

                    online: widget.online,text: 'These are very nice images, but honestly speaking, I expected much better!', streak: true, firstStreak: true,   color: widget.color,),
                  SizedBox(
                    height: 8,
                  ),
                  ReceiverBox(
                    name: widget.name,
                    online: widget.online,
                    text: 'I wanted more details in the models.', streak: true,   color: widget.color,),
                  SizedBox(
                    height: 8,
                  ),
                  ReceiverBox(
                    name: widget.name,
                    online: widget.online,
                    text: 'look at these examples', streak: true, lastStreak: true,   color: widget.color,),
                  SizedBox(
                    height: 8,
                  ),
                  ImageBox(online: widget.online, color: widget.color,),
                  SizedBox(
                    height: 16,
                  ),
                  SenderBox(text: 'Okay sir, will adjust them 😟',),
                  SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        height: 40,
                        width: 64,
                        decoration: BoxDecoration(
                          color: Color(0xff262A34),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Image(
                            color: Colors.white54,
                            image: AssetImage('assets/images/typing.gif'),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              )),
              Container(
                width: double.infinity,
                // constraints: BoxConstraints.tightFor(height: 100),
                decoration: BoxDecoration(
                    color: Color(0xff262A34),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30), topRight: Radius.circular(30))),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 28),
                    child: Row(
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: Color(0xff246BFD),
                            shape: BoxShape.circle,
                          ),
                          padding: EdgeInsets.all(10),
                          child: Image(
                            image: AssetImage('assets/images/attach.png'),
                            height: 20,
                          ),
                        ),
                        SizedBox(width: 20),
                        Expanded(
                          child: TextField(
                            textInputAction: TextInputAction.send,

                            controller: controller,
                            maxLines: 3,
                            minLines: 1,
                            decoration: InputDecoration(
                                hintText: 'Write a message', border: InputBorder.none),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


