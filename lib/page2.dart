import 'package:flutter/material.dart';
import 'package:workermanagement1/Entr%C3%A9eAdministrateur/connectAdmin2.dart';
import 'package:workermanagement1/connexionAdmin.dart';

class entree extends StatelessWidget {
  const entree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        child: Column(
          children: [
            Image(image: AssetImage('assets/icons/head.png')),
            SizedBox(height: 35,),

             CircleAvatar(
                radius: 90,
                 backgroundImage: AssetImage('assets/images/logo.png') ,
              ),
               SizedBox(height: 35,),

              TextButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (builder) => connecAdmin() ));
                },
              child: Text('Entrée Super Administrateur', style: TextStyle(color: Color.fromARGB(255, 45, 184, 49), fontSize: 20,  decoration: TextDecoration.underline),)
              ),
              
              SizedBox(height: 35,),
              TextButton( 
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (builder) => ConnexionAdmin() ));

              }, 
              child: Text('Entrée Administrateur', style: TextStyle(color: Color.fromARGB(255, 45, 184, 49), fontSize: 20, decoration: TextDecoration.underline),))

          ],
        ),
      ),
    );
  }
}