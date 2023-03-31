import 'package:flutter/material.dart';
import 'package:workermanagement1/page3.dart';

class connecAdmin extends StatefulWidget {
  const connecAdmin({super.key});

  @override
  State<connecAdmin> createState() => _connecAdminState();
}

class _connecAdminState extends State<connecAdmin> {

   bool _Obsure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            // ignore: prefer_const_constructors
            Image(image: const AssetImage('assets/icons/head.png')),
            // ignore: prefer_const_constructors
            SizedBox(height: 35,),

            // ignore: prefer_const_constructors
            Text('Connexion', style: TextStyle(fontSize: 24),),
             // ignore: prefer_const_constructors
             SizedBox(height: 35,),

            // ignore: sized_box_for_whitespace
            Container(
              width: 300,
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.email),
                  hintText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40)
                  )
                ),
              ),
            ),
             // ignore: prefer_const_constructors
             SizedBox(height: 35,),

             // ignore: sized_box_for_whitespace
             Container(
              width: 300,
              child: TextField(
                obscureText: !_Obsure,
                decoration: InputDecoration(
                  // ignore: prefer_const_constructors
                  prefixIcon: Icon(Icons.lock),
                  hintText: 'password',
                  suffixIcon: IconButton(
                    icon: Icon(
                        _Obsure? Icons.visibility: Icons.visibility_off 
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
            // ignore: prefer_const_constructors
            SizedBox(height: 35,),
            // ignore: prefer_const_constructors
            Padding(
              // ignore: prefer_const_constructors
              padding: EdgeInsets.only(left: 250.0),
              // ignore: prefer_const_constructors
              child: Text('Mot de passe oublié ?'),
            ),
            // ignore: prefer_const_constructors
            SizedBox(height: 20,),

            Container(
              width: 209,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                // ignore: prefer_const_constructors
                color: Color.fromARGB(255, 45, 184, 49),
              ),
              child:  TextButton(
                onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (builder) => accueil() ));
                }, 
                // ignore: prefer_const_constructors
                child: Text('Connexion', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),)),
            ),

            // ignore: prefer_const_constructors
            SizedBox(height:  250,),

            const Padding(
              padding: EdgeInsets.all(15.0),
              child: Row(
                children: [
                  Text("Vous n'avez pas encore de compte?", style: TextStyle(fontSize: 15),),
                  Spacer(),
                  Text("Créer un compte", style: TextStyle(color: Color.fromARGB(255, 45, 184, 49), fontSize: 15),),
              ],),
            )
          ],
        ),
      ),
    );
  }
}