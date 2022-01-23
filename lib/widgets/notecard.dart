import 'package:flutter/material.dart';
import 'package:substring_highlight/substring_highlight.dart';

import '../constants.dart';

class NoteCard extends StatelessWidget {
  final String text;
  final String date;
  final String name;
  final int color;
  final bool read;
  final VoidCallback? onTap;

  const NoteCard({Key? key, this.text: 'Hi @tranmautritam, when you have time please take a look at the new designs I just made in Figma. 👋', this.date: 'Nov 2', this.name: 'Benjamin Poole', this.color: 4, this.read: true, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 40),
      child: GestureDetector(
       onTap: onTap,
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 48,
                  width: 48,
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
                SizedBox(width: 24),
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                              child: Text(
                                name,
                                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
                                maxLines: 1,
                              )),
                          Spacer(),
                          Text(
                            date,
                            style: TextStyle(
                                fontSize: 13,
                                color: read ? Color(0xff5E6272): Color(0xffBBFFE7),
                                fontWeight: FontWeight.w700),
                            maxLines: 1,
                          ),
                        ],
                      ),
                      SizedBox(height: 8,),
                      SubstringHighlight(
                        text: text,
                        terms: text.split(' ').where((e) => e.contains('@')).toList(),
                        textStyle: TextStyle(color: Color(0xff5E6272), fontSize: 13, letterSpacing: 0.4, fontWeight: FontWeight.w400),
                        textStyleHighlight: TextStyle(color: Color(0xffFBA3FF), fontSize: 13, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(height: 25,),
            Divider(color: Color(0xff5E6272).withOpacity(0.6), )
          ],
        ),
      ),
    );
  }
}
