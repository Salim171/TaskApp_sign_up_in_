import 'package:flutter/material.dart';
import 'package:sign_up_in_home/theme/theme.dart';
import 'package:sign_up_in_home/widgets/dialog_button.dart';



class DialogBox extends StatelessWidget{
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

   DialogBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
   });


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AlertDialog(
      backgroundColor: Colors.white,
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //user Input
            TextField(
              controller: controller,
              decoration:InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(
                    color: Colors.white,
                  ),
                ),
                hintText: 'Add a new task',
              ),
            ),

            // save button -- cancel button
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [

                // save button
                DialogButton(text: 'Save', onPressed: onSave),


                const SizedBox(width: 10,),

                // cancel button
                DialogButton(text: 'Cancel', onPressed: onCancel),
              ],
            )
          ],
        ),
      ),

    );
  }
}







