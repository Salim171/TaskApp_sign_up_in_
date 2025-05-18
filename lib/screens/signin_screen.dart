import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:matcher/matcher.dart';
import 'package:sign_up_in_home/screens/tasks_screen.dart';
import 'package:sign_up_in_home/theme/theme.dart';
import 'package:sign_up_in_home/widgets/custom_scaffold.dart';


class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState ();


}



class _SignInScreenState extends  State<SignInScreen>{

  final _formSignInKey =GlobalKey<FormState>();
  final _emailController = TextEditingController();
  bool rememberPassword = false;

  //final _formKey = GlobalKey<FormState>();

  final _passwordController = TextEditingController();


  final String correctemail = 'admin';
  final String correctpassword = 'admin';





  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return  CustomScaffold(
      child: Column(
        children: [
          const Expanded(
            flex: 1,
              child:
              SizedBox(height: 10,)
          ),
          Expanded(
            flex: 7,

              child:Container(
                padding: const EdgeInsets.fromLTRB(25, 50, 25, 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40)
                  )
                ),

                child: SingleChildScrollView(
                  child: Form(
                    key: _formSignInKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                              'welcome back ',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w900,
                              color: lightColorScheme.primary,
                            ),
                          ),
                          SizedBox(height: 40,),
                          TextFormField(
                            controller: _emailController,
                            validator: (value){
                              if (value == null || value.isEmpty ) {
                                return 'Please Enter Email';
                              }
                              else if (value != correctemail) {
                                return 'Incorrect Email';
                              }
                  
                              return null;
                  
                            },
                              decoration: InputDecoration(
                                label: const Text('Email'),
                                hintText: 'Enter your Email',
                                hintStyle: const TextStyle(
                                  color: Colors.black26,
                                ),
                                border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Colors.black12,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Colors.black12,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                )
                              )
                  
                            ,
                  
                          ),

                          SizedBox(height: 25,),
                          TextFormField(
                            controller: _passwordController,
                            obscureText: true,
                            obscuringCharacter: '*',
                            validator: (value){
                              if (value == null  || value.isEmpty){
                                return 'Please Enter Password';
                              }
                              else if (value != correctpassword) {
                                return 'Incorrect password';
                              }
                              return null;
                            },
                            decoration:  InputDecoration(
                              label: Text('Password'),
                              hintText: 'Enter your password',
                              hintStyle: TextStyle(
                                color: Colors.black12
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.black12,
                                ),
                                borderRadius: BorderRadius.circular(10)
                                    
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.black12
                                ),
                                borderRadius: BorderRadius.circular(10)
                              )
                            ),
                          ),
                          SizedBox(height: 25,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Checkbox(value: rememberPassword, onChanged: (bool? value){
                                    setState(() {
                                      rememberPassword = value!;

                                    });
                                  },
                                    activeColor: lightColorScheme.primary,
                                  ),
                                  const Text(
                                    'Remember me',
                                    style: TextStyle(
                                      color: Colors.black45,
                                    ),
                                  )
                                ],
                              ),
                              GestureDetector(
                                child: Text('Forget password?',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: lightColorScheme.primary,
                                ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 25,),

                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(

                              onPressed: () {
                                if (_formSignInKey.currentState!.validate() && rememberPassword) {
                                  Navigator.push(
                                   context,
                                    MaterialPageRoute(builder: (context) => TasksScreen())
                                  );
                                  // Both email and password are correct
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text('Login successful')),
                                  );
                                }
                                else if (_formSignInKey.currentState!.validate()) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text('Please agree to the processing of personal Data')
                                      )
                                  );
                                }
                              },
                              child: Text('Login'),
                            ),
                          ),

                          SizedBox(height: 25,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                  child: Divider(
                                    thickness: 0.7,
                                    color: Colors.grey.withOpacity(0.5),
                                  )
                              ),
                              Padding(padding: EdgeInsets.symmetric(
                                horizontal: 10
                              ),
                                child: Text('Sing up with',
                                style: TextStyle(
                                  color: Colors.black45,
                                ),
                                ),
                              ),

                              Expanded(child: Divider(
                                thickness: 0.7,
                                color: Colors.grey.withOpacity(0.5),
                              )
                              ),
                            ],
                          ),
                          SizedBox(height: 25,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Logo(Logos.facebook_f),
                              Logo(Logos.twitter),
                              Logo(Logos.google),
                              Logo(Logos.apple),

                            ],
                          )
                  
                  
                        ],
                  
                  )),
                ),
              )
          
          ),
        ],
      )
    );
  }
}