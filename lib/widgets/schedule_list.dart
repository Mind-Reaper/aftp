import 'dart:ffi';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import 'expanded_section.dart';

class ScheduleList extends StatefulWidget {
  final String title;
  final Widget child;
  final VoidCallback? onAdd;

  const ScheduleList({Key? key, this.title: '0040-0000', this.child: const SizedBox(), this.onAdd})
      : super(key: key);

  @override
  State<ScheduleList> createState() => _ScheduleListState();
}

class _ScheduleListState extends State<ScheduleList> with SingleTickerProviderStateMixin {
  bool expand = true;

  late AnimationController _controller;
  double _angle = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 200));
    _controller.addListener(() {
      setState(() {
        _angle = _controller.value * -1.55;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Theme(
          data: ThemeData(highlightColor: Colors.transparent, splashColor: Colors.transparent),
          child: ListTile(

            onTap: () {
              setState(() {
                if (expand) {
                  _controller.forward();
                  expand = false;
                } else {
                  _controller.reverse();
                  expand = true;
                }
              });
            },
            leading: Transform.rotate(
              angle: _angle,
              child: Icon(
                Icons.keyboard_arrow_down,
                color: Colors.white,
              ),
            ),
            title: Text(
              widget.title,
              style: TextStyle(fontSize: 10, fontWeight: FontWeight.w700, color: Color(0xff5E6272)),
            ),
            contentPadding: EdgeInsets.zero,
            minLeadingWidth: 0,
            trailing: GestureDetector(
              onTap: widget.onAdd,
              child: Image(
                image: AssetImage('assets/images/add.png'),
                height: 20,
              ),
            ),
          ),
        ),
        ExpandedSection(expand: expand, child: widget.child)
      ],
    );
  }
}


class ScheduleCard extends StatelessWidget {
  final String title;
  final bool enabled;
  final String subtitle;
  final Color subtitleColor;
  final VoidCallback? onTap;

  const ScheduleCard({Key? key, this.title: 'SN Al-Shujaa', this.enabled: false, this.subtitleColor: const Color(0xffC25FFF), this.subtitle: 'Brow', this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 24),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: enabled ? Color(0xff262A34) : Colors.transparent,
              border: enabled ? null : Border.all(color: Color(0xff5E6272)),

          ),
          child: ListTile(
            contentPadding: EdgeInsets.zero,
            leading: Image(image: AssetImage('assets/images/chat.png'),height: 24,),
            minLeadingWidth: 0,
            title: Text(title, style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16), maxLines: 1,),
            subtitle: Text(subtitle, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: subtitleColor), maxLines: 1,),
            trailing: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(colors: colorTheme[1]),
                image: DecorationImage(
                  image: AssetImage('assets/images/plant.png')
                )
              ),
            ),
          )
      ),
    );
  }
}