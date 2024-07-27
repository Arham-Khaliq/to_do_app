
import 'package:flutter/material.dart';
import 'package:to_do_app/utils/todo_list.dart';

class homePage extends StatefulWidget {
   homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  List toDoList =[
    ['Learn Flutter',false],
    ['Drink Water',false],
    ['Go to Gym',false],
  ];

  final _controller = TextEditingController();

  void checkCoxChanged(int index){
    setState(() {
      toDoList[index][1]=!toDoList[index][1];
    });

  }

  void saveNewTask(){
    setState(() {
      toDoList.add([_controller.text, false]);
      _controller.clear();
    });
  }

  void deleteTask(int index){
    setState(() {
      toDoList.removeAt(index);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('ToDo Task'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        centerTitle: true,

      ) ,
      backgroundColor: Colors.deepPurple.shade100,

      body: ListView.builder(itemBuilder: (context,index){
        return TODOLIST(
          taskName: toDoList[index][0],
          taskCompleted: toDoList[index][1],
          onChanged: (value) => checkCoxChanged(index),
          delete:  (context) => deleteTask(index),
        );
    },

        
    itemCount: toDoList.length,
    ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          children: [
            Expanded(child:

            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: TextField(

                controller: _controller,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.deepPurple.shade200,
                  hintText: 'Add Tasks',
                  focusedBorder: OutlineInputBorder(
                     borderSide:  BorderSide(color: Colors.deepPurple),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:  BorderSide(color: Colors.deepPurple),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderSide:  BorderSide(color: Colors.deepPurple),
                    borderRadius: BorderRadius.circular(20),
                  ),

                ),
              ),
            )
            ),

            FloatingActionButton(
              onPressed: saveNewTask ,
              child: Icon(Icons.add,color: Colors.deepPurple,size: 25,),
            ),

          ],
        ),
      ),
    );
  }
}
