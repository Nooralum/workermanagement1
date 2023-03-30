import 'package:flutter/material.dart';
import 'package:workermanagement1/Entr%C3%A9eAdministrateur/liste2.dart';
import 'package:workermanagement1/Entr%C3%A9eAdministrateur/listeItem2.dart';
import 'package:workermanagement1/commons/collapseListTile.dart';
import 'package:workermanagement1/model/navigation.dart';


class tache extends StatefulWidget {
  tache({super.key});

  @override
  State<tache> createState() => _tacheState();
}

class _tacheState extends State<tache> with SingleTickerProviderStateMixin {
   
  List<String> list = <String>['Item1', 'Item2', 'Item3', 'Item4'];
  String? selectedItem = 'Item1';


  final maList = ToDo.todolist();
  List<ToDo> search = [];
  final monController = TextEditingController();
  final monController2 = TextEditingController();

  double maxWidth = 80;
  double minWidth = 220;
  bool isCollapse = false;
  late AnimationController _animationController;
  late Animation<double> widthAnimation;
  int currentSelectedIndex = 5;

  @override
  void initState() {
    search = maList;
    super.initState();
    _animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 900));
    widthAnimation = Tween<double>(begin: maxWidth, end: minWidth).animate(_animationController);
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Colors.green,
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Column(
              children: [
                searchBox(),
                Expanded(
                  child: ListView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 100.0),
                        child: Container(
                          margin: const EdgeInsets.only(
                            top: 30,
                            bottom: 20,
                            ),
                            child: const Text(
                              "Liste des Travailleurs",
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                        ),
                      ),
                      for(ToDo todo in search)
                      ToDoItem(
                        todo2: todo,
                        SupprimerItem: _deleteItem,
                        ),
                    
                    ],
                  ),
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Container(
                  width: 220,
                  height: 50,
                  margin: const EdgeInsets.only(
                    bottom: 20,
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                 

                ),
                Container(
                  width: 50,
                  height: 50,
                  margin: const EdgeInsets.only(
                    bottom : 20,
                    right: 10,
                    ),
                    child: ElevatedButton(
                      child: Text("+", style:TextStyle(fontSize: 40,),),
                      onPressed: (){
                       showDialog(
                        barrierDismissible: false,
                        context: context, builder: (context){
                        return AlertDialog(
                          content: Container(
                            width: 200,
                            height: 350,
                            child: Column(
                              children: [
                                TextField(
                                     controller: monController,
                                     decoration: InputDecoration(
                                      hintText: 'Nom & Prénom',
                                    ),
                                  ),
                                   TextField(
                                     decoration: InputDecoration(
                                      hintText: 'email',
                                    ),
                                  ),
                                  TextField(
                                     decoration: InputDecoration(
                                      hintText: 'ville',
                                    ),
                                  ),
                                  TextField(
                                     decoration: InputDecoration(
                                      hintText: 'téléphone',
                                    ),
                                  ),
                                  SizedBox(
                                    width: 300,
                                    child: DropdownButtonFormField<String>(
                                      hint: Text('Tâche'),
                                      // value: selectedItem,
                                      items: list
                                          .map((list) => DropdownMenuItem<String>(
                                              value: list,
                                              child: Text(list, style: TextStyle(fontSize: 24))
                                        )).toList(), 
                                        onChanged: (list) => setState(()=> selectedItem = list),
                                      ),
                                  ),
                                  

                                 Row(
                                   children: [
                                    Spacer(),
                                     TextButton(
                                      onPressed: (){
                                          _addItem(monController.text, monController2.text);
                                          Navigator.of(context).pop();
                                      }, 
                                      child: const Text(
                                        'Valider',
                                        style: TextStyle(
                                          color: Colors.green,
                                          fontSize: 20,
                                        ),
                                      )),

                                      TextButton(
                                      onPressed: (){
                                          Navigator.of(context).pop();
                                      }, 
                                      child: const Text(
                                        'Annuler',
                                        style: TextStyle(
                                          color: Colors.green,
                                          fontSize: 20,
                                        ),
                                      )),
                                   ],
                                 )
                              ],
                            ),
                          ),

                        );
                       });
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue,
                        minimumSize: Size(60, 60),
                        elevation: 10,
                      ),

                      ),

                  
                  ),
               
              ],
            ),

          ),
           AnimatedBuilder(
              animation: _animationController, 
              builder: (context,widget) => getWidget(context, widget),
           ),
        ],
      ),
    );
  }


 void _deleteItem(String id){
      setState(() {
        maList.removeWhere((item)  => item.id == id );
        
      });
    }

  void _addItem(String todo, String matache){
    setState(() {
      maList.add(ToDo(
      id: DateTime.now().millisecondsSinceEpoch.toString(), 
    Text: todo, tache: matache));
    });
    monController.clear();
    monController2.clear();
  }

  void _research(String enteredKeyword){
    List<ToDo> results = [];
    if (enteredKeyword.isEmpty){ // si le mot clé entré est vide,
      results = maList;  //  les résultats seront pris dans la liste des taches
    } else {
      results = maList
      .where((item) => item.Text!
          .toLowerCase()
          .contains(enteredKeyword.toLowerCase()))
      .toList();
    }
    setState(() {
       search = results;
    });

  }

  Widget searchBox(){
    return Padding(
      padding: const EdgeInsets.only(top: 50.0, left: 60.0),
      child: Container(
                width: 300,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20)
                ),
                child:  TextField(
                  onChanged: (value) =>  _research(value),
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(0),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.blue,
                      size: 20,
                      ),
                      prefixIconConstraints: BoxConstraints(
                        maxHeight: 20,
                        minWidth: 25,
                      ),
                      border: InputBorder.none,
                      hintText: 'search',
                      hintStyle: TextStyle(color: Colors.grey),
    
                  ),
                ),
              ),
    );
  }


  Widget getWidget(context,  widget){
    return Container(
      width:  widthAnimation.value,
      color: Colors.grey[800],
      child: Column(
        children: [
          const SizedBox(height: 50.0,),
             CollapseList(
              title: 'Worker Management',
              icon: Icons.person, animationController: _animationController,
            ),
         const Divider(color: Colors.white, height: 40.0,),
          Expanded(
            child:  ListView.separated(
              separatorBuilder: (context, counter){
                return const Divider(color: Colors.black, height: 12.0,);
              },
              itemBuilder: (context, counter){
              return CollapseList(
                onTap: (){
                  currentSelectedIndex = counter;
                },
                isSelected: currentSelectedIndex == counter,
                 title: navigationItems[counter].title,
                 icon: navigationItems[counter].icon,
                 animationController: _animationController,
    
            );
            
          },
          itemCount: navigationItems.length,
          )
          ),
          InkWell(
            onTap:(){
              setState(() {
                isCollapse = !isCollapse;
                isCollapse ?  _animationController.forward() :  _animationController.reverse();
              });
            },
            child: AnimatedIcon(
              icon: AnimatedIcons.close_menu,
              progress: _animationController,
              color: Colors.black, 
              size: 40.0,
              ),
          ),
           const SizedBox(height: 50.0,),
         
        ],
      ),
    );

  }
}

