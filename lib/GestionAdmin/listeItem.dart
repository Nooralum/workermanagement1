import 'package:flutter/material.dart';
import 'package:workermanagement1/GestionAdmin/liste.dart';

class ToDoItem extends StatelessWidget {
  final ToDo todo;
  final SupprimerItem;
  const ToDoItem({super.key, required this.todo, this.SupprimerItem});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 75.0, ),
      child: Column(
        children: [
          Container(
            width: 450,
            margin: const EdgeInsets.only(bottom: 20),
            child: ListTile(
              onTap: (){
                
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              tileColor: Colors.white,
              title: Text(
                todo.Text!,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black, 
                ),
                ),
                subtitle: Text(
                  '${todo.Code}'
                ),
                leading: Container(
                 child: Icon(
                  Icons.edit,
                  color: Colors.black,
                 )
                ),
                trailing: Container(
                  padding: EdgeInsets.all(0),
                  height: 35,
                  width: 35,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: IconButton(
                     color: Colors.green,
                     icon: Icon(Icons.delete),
                     iconSize: 30,
                     onPressed: (){
                      SupprimerItem(todo.id);
                     },
                    ),
                 ),
            ),
          ),
        ],
      ),
    );
  }
}