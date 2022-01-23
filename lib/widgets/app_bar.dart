import 'package:aftp/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomBar extends StatelessWidget {
  final bool showBack;
  final bool emptyBar;
  final String title;
  final bool online;
  final Widget trailing;

  const CustomBar(
      {Key? key,
      this.showBack: true,
      this.emptyBar: false,
      this.title: '',
      this.trailing: const SizedBox(
        width: 28,
      ), this.online: false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (emptyBar) SizedBox(height: 28),
          if (showBack)
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                height: 28,
                width: 28,
                child: Center(
                  child: Image(
                    image: AssetImage('assets/images/left.png'),
                  ),
                ),
              ),
            ),

          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
           if(online)   Container(
                height: 10,
                width: 10,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
gradient: LinearGradient(colors: colorTheme[2])
                ),
              ),
              SizedBox(width: 8),
              Text(
                title,
                style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w700),
              ),
            ],
          ),

          trailing
        ],
      ),
    );
  }
}
