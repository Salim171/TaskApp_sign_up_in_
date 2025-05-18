import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:sign_up_in_home/theme/theme.dart';




class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;
  final Function()? updateFunction;

   ToDoTile({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
     required this.deleteFunction,
     required this.updateFunction,
  });



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25,right: 25,top: 25),

        child: Slidable(
          endActionPane: ActionPane(
              motion: StretchMotion(),
              children: [
                SlidableAction(onPressed: deleteFunction,
                icon: Icons.delete,
                backgroundColor: Colors.red.shade300,
                borderRadius: BorderRadius.circular(12),
                )
              ]),
          child: Container(
            padding: EdgeInsets.all(25),
            child: Row(
              children: [
                //checkbox
                Checkbox(
                  value: taskCompleted,
                  onChanged: onChanged,
                  activeColor: Colors.white,
                  checkColor: lightColorScheme.primary,
                  side: const BorderSide(
                    color: Colors.white,
          
                  ),
                ),

                //Tasks Name
                Text(taskName,
                style: TextStyle(
                  color: Colors.white,
                  decoration: taskCompleted ? TextDecoration.lineThrough : TextDecoration.none,
                  decorationColor: Colors.white,
                  decorationThickness: 2.5//set the color of the line
          
                ),
                ),

                Spacer(),

                //edit task
                IconButton(
                  onPressed: () {
                    updateFunction!();
                  },
                  icon: const Icon(Icons.edit),
                  color: Colors.white,
                  iconSize: 22,
                ),
              ],
            ),
            decoration: BoxDecoration(color: lightColorScheme.primary,
            borderRadius: BorderRadius.circular(12)
            ),
          ),
        ),

    );
  }
}

