import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TODOLIST extends StatelessWidget {
  const TODOLIST({super.key, required this.taskName, required this.taskCompleted, this.onChanged, this.delete});


  final String taskName;
  final bool taskCompleted;
  final Function(bool?)? onChanged;
  final Function(BuildContext)? delete;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0,left: 15,right: 15),
      child: Slidable(
        endActionPane: ActionPane(motion: StretchMotion(),
            children:[
            SlidableAction(
              onPressed: delete,
              icon: Icons.delete_outlined,
              borderRadius: BorderRadius.circular(20),
              backgroundColor: Colors.red,
            label: 'Delete',
            )
            ]
      ) ,
        child: Container(
          padding: EdgeInsets.all(20.0),
          decoration: BoxDecoration(
              color: Colors.deepPurple.shade400,
              borderRadius: BorderRadius.circular(20)
          ),
          child: Row(
            children: [
        
              Checkbox(value:
                taskCompleted,
                onChanged: onChanged,
                checkColor: Colors.black,
                activeColor: Colors.white,
                side: BorderSide(color: Colors.white),
        
        
              ),
              Text(
                taskName,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    decoration: taskCompleted
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
                    decorationColor: Colors.white,
                    decorationThickness: 2,
        
                  ),),
            ],
          ),
        ),
      ),
    );
  }
}
