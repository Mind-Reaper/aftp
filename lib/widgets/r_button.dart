import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String title;

  const RButton({Key? key, this.onPressed, this.title: 'Continue'}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,

      color: Color(0xff246BFD),
      elevation: 8,
      height: 48,
      child: Text(
        title,
        style: GoogleFonts.inter(
            color: Colors.white, fontWeight: FontWeight.w700, fontSize: 14),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
    );
  }
}