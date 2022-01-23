import 'package:aftp/main.dart';
import 'package:aftp/screens/signup.dart';
import 'package:aftp/widgets/app_bar.dart';
import 'package:aftp/widgets/r_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ConfirmNumber extends StatefulWidget {
  const ConfirmNumber({Key? key}) : super(key: key);

  @override
  _ConfirmNumberState createState() => _ConfirmNumberState();
}

class _ConfirmNumberState extends State<ConfirmNumber> {
  final key = GlobalKey<FormFieldState>();
  TextEditingController controller = TextEditingController();
  String number = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background(
        showPolygon: true,
        child: SafeArea(
          child: Column(
            children: [
              CustomBar(
                showBack: false,
                emptyBar: true,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: ListView(
                    keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                    physics: BouncingScrollPhysics(),
                    children: [
                      Text(
                        'What’s your ATFP number?',
                        style: GoogleFonts.poppins(
                            fontSize: 32, fontWeight: FontWeight.w600, letterSpacing: 1.0),
                      ),
                      SizedBox(height: 24),
                      Text(
                        'YOUR NUMBER',
                        style: TextStyle(
                            fontWeight: FontWeight.w700, color: Color(0xff3A3D46), fontSize: 10),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: controller,
                        key: key,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value!.length < 10) {
                            return 'Please enter a valid number!';
                          } else {
                            return null;
                          }
                        },
                        onSaved: (value) {
                          number = value!;
                        },
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            hintText: 'Number',
                            errorStyle: TextStyle(color: Color(0xffA5F59C)),
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xff3A3D46)),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xffA5F59C)),
                            ),
                            suffix: GestureDetector(
                              onTap: () => controller.clear(),
                              child: Image(
                                image: AssetImage('assets/images/close.png'),
                                height: 16,
                              ),
                            )),
                      ),
                      SizedBox(height: 32),
                      RButton(
                        onPressed: () {
                          bool valid = key.currentState!.validate();
                          if(valid) {
                            key.currentState!.save();
                            Navigator.push(
                                context, MaterialPageRoute(builder: (context) => SignUp(number: number,)));
                          }
                        },
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
