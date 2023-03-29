import 'package:flutter/material.dart';
import 'package:workermanagement1/GestionAdmin/CreerAdmin.dart';
import 'package:workermanagement1/GestionAdmin/home.dart';

class shadow extends StatefulWidget {
  const shadow({super.key, required this.image1, required this.text,  required this.taper});

  final Image image1;
  final Text text;
  final Widget taper;


  @override
  State<shadow> createState() => _shadowState();
}

class _shadowState extends State<shadow> {
  @override
  Widget build(BuildContext context) {
    final color = Colors.green[100];
    return Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 45.0),
          child: Container( 
               height: 160,
               width: 160,
              decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.all(Radius.circular(100)),
                  boxShadow:[
                      BoxShadow(
                          spreadRadius: 1,
                          blurRadius: 2,
                          offset: Offset.fromDirection(5, 2.0)
                        )
                      ]
                    ),
              child: Center(
                    child: TextButton(
                      onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (builder) => widget.taper));
                      },
                      child:ListTile(
                        title: widget.image1,
                         subtitle: widget.text,
                         
                      ),
                    )
                     
                    
                    
                    
                    )
                   ),
        ),
              );
  }

}

