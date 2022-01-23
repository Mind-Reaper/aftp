import 'package:aftp/screens/conversation.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class ChatLine extends StatelessWidget {
  final String name;
  final int color;
  final VoidCallback? onTap;
  final bool online;

  const ChatLine({Key? key, this.name: 'Garrett Reid', this.color: 1, this.onTap, this.online: true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap?? () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Conversation(name: name, color: color, online: online,)));

      },
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading:   Stack(
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
            if(online) Container(
              height: 10,
              width: 10,
              decoration: BoxDecoration(
                  color: Color(0xff9ADB7F),
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.black, width: 1.5)
              ),
            )
          ],
        ),
        title: Text(name, style: TextStyle(
            fontWeight: FontWeight.w600
        ),),
      ),
    );
  }
}
