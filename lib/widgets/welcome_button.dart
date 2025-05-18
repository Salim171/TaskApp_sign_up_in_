import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:matcher/matcher.dart';
import 'package:sign_up_in_home/screens/signup_screen.dart';

class WelcomeButton extends StatelessWidget {
  const WelcomeButton({super.key,  this.buttonText, this.onTap, this.color, this.textColor});

  final String? buttonText;
  final Widget? onTap;
  final Color? color,textColor;

  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (e)=>onTap!,
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.all(30),
        decoration: BoxDecoration(
          color: color!,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50)
          )
        ),
          child:  Text(
              buttonText!,
          textAlign: TextAlign.center,
          style:  TextStyle(
            overflow: TextOverflow.ellipsis,
            fontSize: 17,
            fontWeight: FontWeight.bold,
            color: textColor!,
      
          )
            )),
    );
  }
}