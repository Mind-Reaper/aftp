import 'package:aftp/constants.dart';
import 'package:aftp/main.dart';
import 'package:aftp/providers/state_provider.dart';
import 'package:aftp/screens/login.dart';
import 'package:aftp/widgets/app_bar.dart';
import 'package:aftp/widgets/r_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SignUp extends StatefulWidget {
  final String number;

  const SignUp({Key? key, this.number: ''}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool obscure = true;
  // TextEditingController controller = TextEditingController();
  String name = 'Dan';
  String password = '';
  final key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var stateProvider = Provider.of<StateProvider>(context);
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
                    physics: BouncingScrollPhysics(),
                    keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                    children: [
                      Text(
                        'New user',
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
                      Form(
                        key: key,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'YOUR NAME',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xff3A3D46),
                                  fontSize: 10),
                            ),
                            SizedBox(height: 20),
                            TextFormField(
                              enabled: false,
                              initialValue: name,
                              decoration: fieldDecoration.copyWith(
                                hintText: 'Name',
                              ),
                              validator: (value) {
                                if (value!.length < 3) {
                                  return "Input at least 3 characters";
                                } else {
                                  return null;
                                }
                              },
                              onSaved: (value) {
                                name = value!;
                              },
                            ),
                            SizedBox(height: 23),
                            Text(
                              'YOUR PASSWORD',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xff3A3D46),
                                  fontSize: 10),
                            ),
                            SizedBox(height: 20),
                            TextFormField(
                              obscureText: obscure,
                              decoration: fieldDecoration.copyWith(
                                  hintText: 'Password',
                                  suffix: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          obscure = !obscure;
                                        });
                                      },
                                      child: Image(
                                        image: AssetImage(
                                            'assets/images/${obscure ? 'show' : 'hide'}.png'),
                                        height: 16,
                                      ))),
                              validator: (value) {
                                if (value!.length < 8) {
                                  return 'Password should contain at least characters';
                                } else {
                                  return null;
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 23),
                      RButton(
                        onPressed: () {
                          bool valid = key.currentState!.validate();
                          if (valid) {
                            key.currentState!.save();
                            stateProvider.changeName(name);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignIn(
                                          number: widget.number,
                                        )));
                          }
                        },
                        title: 'Sign Up',
                      )
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
