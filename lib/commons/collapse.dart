import 'package:flutter/material.dart';
import 'package:workermanagement1/GestionAdmin/CreerAdmin.dart';
import 'package:workermanagement1/Voir%20bilan/home.dart';
import 'package:workermanagement1/commons/Shadow.dart';
import 'package:workermanagement1/commons/collapseListTile.dart';
import 'package:workermanagement1/connexionAdmin.dart';
import 'package:workermanagement1/model/navigation.dart';
import 'package:workermanagement1/page2.dart';


class CollapsingNavigationDrawer extends StatefulWidget {
  const CollapsingNavigationDrawer({super.key});

  @override
  State<CollapsingNavigationDrawer> createState() => _CollapsingNavigationDrawerState();
}

class _CollapsingNavigationDrawerState 
      extends State<CollapsingNavigationDrawer> with SingleTickerProviderStateMixin {
  double maxWidth = 80;
  double minWidth = 220;
  bool isCollapse = false;
  late AnimationController _animationController;
  late Animation<double> widthAnimation;
  int currentSelectedIndex = 5;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 900));
    widthAnimation = Tween<double>(begin: maxWidth, end: minWidth).animate(_animationController);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(height: 60,),
                const Padding(
                  padding: EdgeInsets.only(left: 60),
                  child: Text('Débuter votre Gestion', style: TextStyle(fontSize: 30),),
                  ),
                SizedBox(height: 50,),
                shadow(image1: Image.asset("assets/icons/gestion.png", width: 42.85, height: 42.51, ), text: Text('\r \r \r Gestion Administrateur', style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),), taper: todolist(),),
                SizedBox(height: 50,),
                shadow(image1: Image.asset('assets/icons/bilan.png', width: 42.85, height: 42.51,), text: Text('\r \r \r Voir bilan', style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold), ), taper: bilan(),),
                SizedBox(height: 50,),
                shadow(image1: Image.asset('assets/icons/settings.png', width: 42.85, height: 42.51,), text: Text('\r \r \r Parametre', style: TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.bold),), taper: entree(),),
                
              ],
            ),
             AnimatedBuilder(
                animation: _animationController, 
                builder: (context,widget) => getWidget(context, widget),
             ),
      
             
      
            
          ],
      
        ),
      )
     
      
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




 
