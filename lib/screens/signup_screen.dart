import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:matcher/matcher.dart';
import 'package:sign_up_in_home/screens/signin_screen.dart';
import 'package:sign_up_in_home/screens/welcome_screen.dart';
import 'package:sign_up_in_home/theme/theme.dart';
import 'package:sign_up_in_home/widgets/custom_scaffold.dart';


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends  State<SignUpScreen>{
  final _SignUpScreenKey = GlobalKey<FormState>();
  bool agreePersonalData = true;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  CustomScaffold(
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: SizedBox(height: 10,)
            ,),
          Expanded(
            flex: 7,
              child: Container(
                padding: EdgeInsets.fromLTRB(25, 50, 25, 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  )
                ),
                child: SingleChildScrollView(
                  child: Form(
                    key: _SignUpScreenKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('Get Started',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w900,
                            color: lightColorScheme.primary,
                          ),
                          ),

                          SizedBox(height: 40,),

                          // full name
                          TextFormField(
                            validator: (value){
                              if (value == null || value.isEmpty) {
                                return 'Please enter Full name';
                              }
                              // Check for two words
                              if (!value.trim().contains(' ')) {
                                return 'Please enter both first and last name';
                              }

                              // Check if only letters and spaces are used
                              if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value.trim())) {
                                return 'Name can only contain letters and spaces';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              label: Text('Full Name'),
                              hintText: 'Enter Full Name',
                              hintStyle: TextStyle(
                                color: Colors.black26,
                              ),
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.black12, // Default border color
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.black12, // Default border color
                                ),
                                borderRadius: BorderRadius.circular(10),
                              )
                            ),
                          ),

                          SizedBox( height: 25.0,),

                          //email
                          TextFormField(
                            validator: (value){
                              if (value == null || value.isEmpty) {
                                return 'Please enter Email ';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                label: Text('Email'),
                                hintText: 'Enter Full Name',
                                hintStyle: TextStyle(
                                  color: Colors.black26,
                                ),
                                border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Colors.black12, // Default border color
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Colors.black12, // Default border color
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                )
                            ),
                          ),

                          SizedBox( height: 25.0,),

                          //password
                          TextFormField(
                            obscureText: true,
                            obscuringCharacter: '*',
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter Password';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              label: const Text('Password'),
                              hintText: 'Enter Password',
                              hintStyle: const TextStyle(
                                color: Colors.black26,
                              ),
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.black12, // Default border color
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.black12, // Default border color
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),

                          SizedBox( height: 25.0,),

                          // i agree to the processing
                          Row(
                            children: [
                              Checkbox(
                                value: agreePersonalData,
                                onChanged: (bool? value) {
                                  setState(() {
                                    agreePersonalData = value!;
                                  });
                                },
                                activeColor: lightColorScheme.primary,
                              ),
                              const Text(
                                'I agree to the processing of ',
                                style: TextStyle(
                                  color: Colors.black45,
                                ),
                              ),
                              Text(
                                'Personal data',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: lightColorScheme.primary,
                                ),
                              ),
                            ],
                          ),

                          SizedBox( height: 25.0,),
                          // signup button
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                if (_SignUpScreenKey.currentState!.validate() &&
                                    agreePersonalData) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Processing Data'),
                                      duration: Duration(seconds: 2),

                                    ),

                                  );

                                  Future.delayed(const Duration(seconds: 2), () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => WelcomeScreen(),
                                      ),
                                    );
                                  });

                                } else if (!agreePersonalData) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text(
                                            'Please agree to the processing of personal data')),
                                  );
                                }

                              },
                              child: const Text('Sign up'),
                            ),
                          ),

                          SizedBox( height: 30.0,),

                          // sign up divider
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Divider(
                                  thickness: 0.7,
                                  color: Colors.grey.withOpacity(0.5),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: 0,
                                  horizontal: 10,
                                ),
                                child: Text(
                                  'Sign up with',
                                  style: TextStyle(
                                    color: Colors.black45,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Divider(
                                  thickness: 0.7,
                                  color: Colors.grey.withOpacity(0.5),
                                ),
                              ),
                            ],
                          ),

                          SizedBox( height: 30.0,),

                          //social media logo
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Flexible(child: SizedBox(width: 30, height: 30, child: Logo(Logos.facebook_f),),),
                              Flexible(child: SizedBox(width: 30, height: 30, child: Logo(Logos.twitter),),),
                              Flexible(child: SizedBox(width: 30, height: 30, child: Logo(Logos.google),),),
                              Flexible(child: SizedBox(width: 30, height: 30, child: Logo(Logos.apple),),),
                            ],
                          ),


                          SizedBox( height: 25.0,),

                          //  have an account??
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Already have an account? ',
                                style: TextStyle(
                                  color: Colors.black45,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (e) => const SignInScreen(),
                                    ),
                                  );
                                },
                                child: Text(
                                  'Sign in',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: lightColorScheme.primary,
                                  ),
                                ),
                              ),
                            ],
                          ),







                        ],
                      )),
                ),
              )
          )
        ],
      ),

    );
  }
}