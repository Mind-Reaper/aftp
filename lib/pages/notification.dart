import 'package:aftp/constants.dart';
import 'package:aftp/providers/state_provider.dart';
import 'package:aftp/widgets/app_bar.dart';
import 'package:aftp/widgets/notecard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:substring_highlight/substring_highlight.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  String text =
      "Hi @tranmautritam, when you have time please take a look at the new designs I just made in Figma. 👋";

  @override
  Widget build(BuildContext context) {
    var stateProvider = Provider.of<StateProvider>(context);
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Column(
          children: [
            CustomBar(
              showBack: false,
              title: 'Notification',
              trailing: Container(
                height: 48,
                width: 48,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(colors: colorTheme[stateProvider.theme])),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image(
                    image: AssetImage('assets/images/plant.png'),
                  ),
                ),
              ),
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 32),
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: [
                  NoteCard(text: text, read: false,),
                  NoteCard(
                    name: 'Katharine Wells',
                    text: 'Please make the presentation as soon as possible Tam. We’re still waiting for it. 🏀',
                    color: 1,
                  ),
                  NoteCard(
                    name: 'Bertha Ramos',
                    text: 'Are you actually working? I don’t see any new stuffs from you. Be creative!!! 🤯 ',
                    color: 7,
                    date: 'Nov 1',
                  ),
                  NoteCard(
                    name: 'Marie Bowen',
                    text: 'Are you actually working? I don’t see any new stuffs from you. Be creative!!! 🤯 ',
                    color: 6,
                    date: 'Oct 29',
                  )
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}

