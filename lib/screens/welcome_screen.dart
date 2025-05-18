
import 'package:flutter/material.dart';
import 'package:sign_up_in_home/screens/signin_screen.dart';
import 'package:sign_up_in_home/screens/signup_screen.dart';
import 'package:sign_up_in_home/screens/tasks_screen.dart';
import 'package:sign_up_in_home/theme/theme.dart';
import 'package:sign_up_in_home/widgets/custom_scaffold.dart';
import 'package:sign_up_in_home/widgets/welcome_button.dart';




class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  CustomScaffold(
      child: Column(
        children: [
          Flexible(
              flex: 8,
              child: Container(
               padding: const EdgeInsets.symmetric(
              vertical: 0,
              horizontal: 40,

            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: 'Welcome Back!\n',
                        style: TextStyle(
                          fontSize: 45,
                          fontWeight: FontWeight.w600,
                          color: Colors.white
                        )

                      ),
                      TextSpan(
                        text:'\n Enter personal details to your employee account',
                        style: TextStyle(
                          fontSize: 20,
                            color: Colors.white

                        )
                      )
                    ]
                  ),
                ),
              ],
            ),
          )),

          //buttons
          Flexible(
            flex: 1,
            child: Align(
              alignment: Alignment.bottomRight,
              child: Row(
                children: [
                  Expanded(

                      child: WelcomeButton(
                        buttonText: 'Sign in',
                        onTap: SignInScreen(),
                        color: Colors.transparent,
                        textColor: Colors.white,
                      )
                  ),
                  Expanded(
                      child: WelcomeButton(
                        buttonText: 'Sign up ',
                        onTap: SignUpScreen(),
                        color: Colors.white,
                        textColor: lightColorScheme.primary,
                      )
                  ),
                  ],
                  ),
            )

            ),

        ],
      ),
    );
  }
}