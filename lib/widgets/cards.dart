import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class DashCard extends StatelessWidget {
 final int theme;
 final String title;
 final VoidCallback? onTap;

  const DashCard({Key? key, this.theme: 1, this.title: "MindReaper", this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
onTap: onTap,
      child: Container(
        height: 64,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16), color: Color(0xff262A34)),
        child: Center(
          child: ListTile(
            leading: Container(
              height: 48,
              width: 48,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: LinearGradient(
                    colors: colorTheme[theme],
                  )),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image(
                    image: AssetImage('assets/images/plant.png')
                ),
              ),
            ),
            title: Text(
              title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            trailing: Icon(CupertinoIcons.forward),
          ),
        ),
      ),
    );
  }
}
