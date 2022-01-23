import 'package:aftp/constants.dart';
import 'package:aftp/main.dart';
import 'package:aftp/providers/state_provider.dart';
import 'package:aftp/screens/home.dart';
import 'package:aftp/widgets/app_bar.dart';
import 'package:aftp/widgets/r_button.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NewWorkspace extends StatefulWidget {
  const NewWorkspace({Key? key}) : super(key: key);

  @override
  _NewWorkspaceState createState() => _NewWorkspaceState();
}

class _NewWorkspaceState extends State<NewWorkspace> {
  int selectedColor = 1;

  @override
  Widget build(BuildContext context) {
    var stateProvider = Provider.of<StateProvider>(context);
    return Scaffold(
      body: Background(
        child: SafeArea(
            child: Column(

          children: [
            CustomBar(
              title: 'New Workspace',
              trailing: Container(
                  height: 48,
                  width: 48,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xffA06AF9),
                  ),
                  child: Image(
                    image: AssetImage('assets/images/avatar.png'),
                    height: 48,
                  )),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: ListView(
                  physics: BouncingScrollPhysics(),

                  children: [
                    Container(
                      height: 112,
                      width: 112,
                      decoration: BoxDecoration(shape: BoxShape.circle, gradient: LinearGradient(colors: colorTheme[selectedColor])),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image(image: AssetImage('assets/images/plant.png'),),
                      ),
                    ),
                    SizedBox(height: 16),
                    Center(
                        child: Text(
                      stateProvider.name,
                      style: GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.w600),
                    )),
                    SizedBox(height: 8),
                    Center(
                        child: Text(
                      'Change Profile Photo',
                      style: TextStyle(
                          color: Color(0xff5E6272), fontSize: 12, fontWeight: FontWeight.w500),
                    )),
                    SizedBox(height: 40),
                    Text(
                      'CHOOSE COLOR THEME',
                      style: TextStyle(
                          color: Color(0xff5E6272), fontSize: 10, fontWeight: FontWeight.w700),
                    ),
                    SizedBox(height: 35),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: GridView.builder(
                          itemCount: colorTheme.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 5, crossAxisSpacing: 12),
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedColor = index;
                                });
                              },
                              child: Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    border: selectedColor == index
                                        ? Border.all(color: Color(0xff246BFD), width: 2)
                                        : Border()),
                                padding: EdgeInsets.all(16),
                                child: Container(
                                  height: 16,
                                  width: 16,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      gradient: LinearGradient(colors: colorTheme[index])),
                                ),
                              ),
                            );
                          }),
                    ),


                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MaterialButton(
                    onPressed: () {},

                    child: Text(
                      'Skip',
                      style: TextStyle(
                          color: Color(0xff5E6272),
                          fontSize: 14,
                          shadows: [
                            Shadow(
                              offset: Offset(2.0, 5.0),
                              blurRadius: 12.0,
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),

                          ],
                          fontWeight: FontWeight.w700),
                    ),
                    height: 5,
                    minWidth: 10,
                    elevation: 10,
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,

                  ),
                  RButton(
                    onPressed: () {
                      stateProvider.changeTheme(selectedColor);
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) => Home()));

                    },
                    title: 'Next',
                  )
                ],
              ),
            )
          ],
        )),
      ),
    );
  }
}
