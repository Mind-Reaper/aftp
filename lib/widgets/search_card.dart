import 'package:flutter/material.dart';

class SearchCard extends StatelessWidget {
  final String name;
  final String number;
  final String date;
  final bool enabled;

  const SearchCard({Key? key, this.name: 'GM1 Roland', this.number: '3315 8909', this.date: 'Dec 2', this.enabled: false}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 24),
      decoration: BoxDecoration(
          border: enabled ? null : Border.all(color: Color(0xff5E6272)),
          color: enabled ? Color(0xff262A34) : Colors.transparent,
          borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        title: Text(
          name,
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
        ),
        subtitle: Text(
          number,
          style: TextStyle(
              fontSize: 13, fontWeight: FontWeight.w500, color: Color(0xff5E6272)),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if(enabled)  Image(image: AssetImage('assets/images/chat.png'), height: 24,),
            SizedBox(width: 24,),
            Text(date, style: TextStyle(color: enabled ?  Color(0xffFBA3FF): Color(0xff5E6272), fontWeight: FontWeight.w700, fontSize: 13),)
          ],
        ),
      ),
    );
  }
}
