import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Service/auth_service.dart';
import '../Service/custom_text_button.dart';
import '../constants.dart';
import '../get_it.dart';
import '../widgets/date_picker.dart';
import '../widgets/form_title_and_field.dart';
import 'login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String? username;
  String? email;
  String? password;
  DateTime? date ;
  String? selectedGender = 'male';
  DateTime selectedDate = DateTime.now();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final authService = getIt<IAuthService>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;

    return Scaffold(
      body: Form(
        key: formKey,
        child: GestureDetector(
          onTap: () {
            FocusScopeNode currentFocus = FocusScope.of(context);
            if (!currentFocus.hasPrimaryFocus) {
              currentFocus.unfocus();
            }
          },
          child: Container(
            color: Colors.white,
            width: size.width,
            height: size.height,
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: 600,
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 50),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.green.withOpacity(0.5),
                    ),
                    child: Column(
                      children: [
                        Text(
                          "Sign Up",
                          style: largestText,
                        ),
                        const SizedBox(height: 50),
                        FormTitleAndField(
                          title: "Your Name:",
                          textEditingController: usernameController,
                          onChanged: (value) {
                            setState(() {
                              username = value;
                            });
                          },
                          onSaved: (value) {
                            setState(() {
                              username = value;
                            });
                          },
                          validate: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your name';
                            }
                            return null;
                          },
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                          Text(
                            "Your Birthday",
                            style: GoogleFonts.montserrat(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[

                                Text(
                                "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}",
                                  style: GoogleFonts.montserrat(
                                    fontSize: 14,),
                                ),
                                IconButton(
                                  onPressed: () {
                                    _selectDate(context);
                                  },
                                  icon: Icon(Icons.date_range_outlined, color: Colors.black54,size: 30,),
                                ),
                              ],
                            ),
                          ),
                        ]),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Your Gender:",
                            style: GoogleFonts.montserrat(
                              fontSize: 16, fontWeight: FontWeight.bold,
                            ),
                          ),
                            ListTile(
                              leading: Radio<String>(
                                value: 'male',
                                groupValue: selectedGender,
                                onChanged: (value) {
                                  setState(() {
                                    selectedGender = value!;
                                  });
                                },
                              ),
                              title: const Text('Male'),
                            ),

                            ListTile(
                              leading: Radio<String>(
                                value: 'female',
                                groupValue: selectedGender,
                                onChanged: (value) {
                                  setState(() {
                                    selectedGender = value!;
                                  });
                                },
                              ),
                              title: const Text('Female'),
                            ),
                              const SizedBox(height: 25),
                        ],
                      ),

                        FormTitleAndField(
                          title: "Your Email:",
                          textEditingController: emailController,
                          onChanged: (value) {
                            setState(() {
                              email = value;
                            });
                          },
                          onSaved: (value) {
                            setState(() {
                              email = value;
                            });
                          },
                          validate: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            }
                            return null;
                          },
                        ),
                        FormTitleAndField(
                          title: "Your Password:",
                          textEditingController: passwordController,
                          obscure: true,
                          onChanged: (value) {
                            setState(() {
                              password = value;
                            });
                          },
                          onSaved: (value) {
                            setState(() {
                              password = value;
                            });
                          },
                          validate: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 30),
                        CustomTextButton(
                            text: "Sign Up",
                            onTap: () async {
                              if (formKey.currentState!.validate()) {
                                print(username);
                                print(email);
                                print(password);
                                print(selectedDate);
                                print(selectedGender);
                                await authService.signUp(
                                  password: password!,
                                  name: username!,
                                  gender: selectedGender!,
                                  dateofbirth: selectedDate,
                                  email: email!,

                                );
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) {
                                    return SignInScreen();
                                  },
                                ));
                              } else {
                                print("not good");
                              }
                            }),
                        const SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Already have an account ? "),
                            InkWell(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) {
                                    return SignInScreen();
                                  },
                                ));
                              },
                              child: Text(
                                "Sign In",
                                style: GoogleFonts.montserrat(
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _selectDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1950),
      lastDate: DateTime(2025),
      fieldLabelText: 'Choose date',
      fieldHintText: 'Month/Date/Year',

    );
    if (selected != null && selected != selectedDate) {
      setState(() {
        selectedDate = selected;
      });
    }
  }
}