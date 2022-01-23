import 'package:aftp/main.dart';
import 'package:aftp/screens/conversation.dart';
import 'package:aftp/screens/new_message.dart';
import 'package:aftp/widgets/app_bar.dart';
import 'package:aftp/widgets/chat_line.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class Chat extends StatefulWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background(
        child: SafeArea(
            child: Column(
          children: [
            CustomBar(
              title: 'Chat',
              trailing: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => NewMessage()));
                },
                child: Container(
                  height: 48,
                  width: 48,
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xff5E6272), width: 2),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.add,
                    size: 30,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                    filled: true,
                    // isDense: true,
                    fillColor: Color(0xff262A34),
                    contentPadding: EdgeInsets.symmetric(horizontal: 4),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8),
                      child: ImageIcon(
                        AssetImage('assets/images/search.png'),
                        color: Colors.white,
                      ),
                    ),
                    hintText: 'Search',
                    suffixIcon: GestureDetector(
                        onTap: () {
                          controller.clear();
                        },
                        child: Icon(
                          Icons.cancel,
                          size: 24,
                          color: Color(0xff181A20),
                        )),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(12),
                    )),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                child: ListView(
                  keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                  physics: BouncingScrollPhysics(),
                  children: [
                    Row(
                      children: [
                        Text(
                          'DIRECT MESSAGES',
                          style: TextStyle(
                              color: Color(0xff5E6272), fontSize: 10, fontWeight: FontWeight.w700),
                        ),
                        Spacer(),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context, MaterialPageRoute(builder: (context) => NewMessage()));
                          },
                          child: Image(
                            image: AssetImage('assets/images/add.png'),
                            height: 18,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Divider(),
                    ChatLine(),
                    ChatLine(
                      name: 'Vincent Lyons',
                      color: 2,
                      online: true,

                    ),
                    ChatLine(
                      name: 'Adeline Nunez',
                      color: 3,
                      online: false,
                    ),
                    ChatLine(
                      name: 'Samuel Doyle',
                      color: 4,
                      online: true,
                    ),
                    ChatLine(
                      name: 'Ruth Benson',
                      color: 5,
                      online: false,
                    ),
                    ChatLine(
                      name: 'Bertha Ramos',
                      color: 6,
                      online: false,
                    ),
                    ChatLine(
                      name: 'Katharine Wells',
                      color: 7,
                      online: true,
                    )
                  ],
                ),
              ),
            )
          ],
        )),
      ),
    );
  }
}
