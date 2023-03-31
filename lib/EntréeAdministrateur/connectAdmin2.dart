import 'package:flutter/material.dart';
import 'package:workermanagement1/Entr%C3%A9eAdministrateur/home.dart';

class ConnexionAdmin extends StatefulWidget {
  const ConnexionAdmin({super.key});

  @override
  State<ConnexionAdmin> createState() => _ConnexionAdminState();
}

class _ConnexionAdminState extends State<ConnexionAdmin> {

  bool _Obsure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: SingleChildScrollView(
         child: Container(
          child: Column(
            children: [
              Image(image: AssetImage('assets/icons/head.png')),
              SizedBox(height: 35,),
       
              Text('Connexion', style: TextStyle(fontSize: 24),),
               SizedBox(height: 35,),
       
               Container(
                width: 300,
                child: TextField(
                  obscureText: !_Obsure,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock, color: Colors.black,),
                    hintText: 'Entrer votre code secret',
                    suffixIcon: IconButton(
                      icon: Icon(
                          _Obsure? Icons.visibility: Icons.visibility_off,
                          color: Colors.black,
                        ),
                        onPressed: (){
                          setState(() {
                            _Obsure = !_Obsure;
                          });
                        }, 
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40)
                    )
                  ),
                ),
              ),
             
              SizedBox(height: 50,),
       
              Container(
                width: 209,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Color.fromARGB(255, 45, 184, 49),
                ),
                child:  TextButton(
                  onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (builder) => accueilAdmin() ));
                  }, 
                  child: Text('Connexion', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),)),
              ),
            ],
          ),
             ),
       ),
    );
  }
}