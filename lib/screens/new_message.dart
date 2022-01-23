import 'package:aftp/main.dart';
import 'package:aftp/widgets/app_bar.dart';
import 'package:aftp/widgets/chat_line.dart';
import 'package:flutter/material.dart';

class NewMessage extends StatefulWidget {
  const NewMessage({Key? key}) : super(key: key);

  @override
  _NewMessageState createState() => _NewMessageState();
}

class _NewMessageState extends State<NewMessage> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background(
        child: SafeArea(child: Column(
          children: [
CustomBar(title: 'New Message'),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 10),
              child: Row(
                children: [
                  Expanded(
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
                    width: 20,
                  ),
                  Text(
                    'Cancel',
                    style: TextStyle(
                        color: Color(0xff5E6272), fontSize: 16, fontWeight: FontWeight.w600),
                  ),

                ],
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
                    Text(
                      'RESULTS',
                      style: TextStyle(
                          color: Color(0xff5E6272), fontSize: 10, fontWeight: FontWeight.w700),
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
