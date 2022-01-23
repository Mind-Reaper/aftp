import 'package:aftp/main.dart';
import 'package:aftp/screens/new_workspace.dart';
import 'package:aftp/widgets/app_bar.dart';
import 'package:aftp/widgets/r_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants.dart';

class SignIn extends StatefulWidget {
  final String number;

  const SignIn({Key? key, this.number: ''}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  bool obscure = true;
  String password = '';
  final key = GlobalKey<FormFieldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background(
        child: SafeArea(
          child: Column(
            children: [
              CustomBar(),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: ListView(
                    keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                    physics: BouncingScrollPhysics(),
                    children: [
                      Text(
                        'Login',
                        style: GoogleFonts.poppins(fontSize: 32, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: 13),
                      RichText(
                        text: TextSpan(
                            children: [
                              TextSpan(text: 'Using '),
                              TextSpan(
                                  text: widget.number,
                                  style:
                                  TextStyle(fontWeight: FontWeight.w700, color: Colors.white)),
                              TextSpan(text: ' to login'),
                            ],
                            style: TextStyle(
                              color: Color(0xff5E6272),
                              fontSize: 13,
                            )),
                      ),
                      SizedBox(height: 37),
                      Text(
                        'YOUR PASSWORD',
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Color(0xff3A3D46),
                            fontSize: 10),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        key: key,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        obscureText: obscure,
                        validator: (value) {
                          if(value!.isEmpty) {
                            return 'Input password';
                          } else {
                            return null;
                          }
                        },
                        decoration: fieldDecoration.copyWith(hintText: 'Password',
                            suffix: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    obscure = !obscure;
                                  });
                                },
                                child: Image(image: AssetImage('assets/images/${obscure ? 'show' : 'hide'}.png'), height: 16,))

                        ),
                      ),
                      SizedBox(height: 32),
                      RButton(
                        title: 'Sign In',
                        onPressed: () {
                          bool valid = key.currentState!.validate();
                          if(valid) {
                            key.currentState!.save();
                            Navigator.push(
                                context, MaterialPageRoute(builder: (context) => NewWorkspace()));
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
