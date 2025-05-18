import 'package:flutter/material.dart';
import 'package:sign_up_in_home/theme/theme.dart';


class DialogButton extends StatelessWidget {
  final String text;
  VoidCallback onPressed;
   DialogButton({
    super.key,
    required this.text,
    required this.onPressed,
  });


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialButton(
      onPressed: onPressed,
      color: lightColorScheme.primary,
      child: Text(text),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
  }
