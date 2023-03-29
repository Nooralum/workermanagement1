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
            Image(image: AssetImage('assets/icons/head.png')),
            SizedBox(height: 35,),

            Text('Connexion', style: TextStyle(fontSize: 24),),
             SizedBox(height: 35,),

            Container(
              width: 300,
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email),
                  hintText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40)
                  )
                ),
              ),
            ),
             SizedBox(height: 35,),

             Container(
              width: 300,
              child: TextField(
                obscureText: !_Obsure,
                decoration: InputDecoration(
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
            SizedBox(height: 35,),
            Padding(
              padding: EdgeInsets.only(left: 250.0),
              child: Text('Mot de passe oublié ?'),
            ),
            SizedBox(height: 20,),

            Container(
              width: 209,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Color.fromARGB(255, 45, 184, 49),
              ),
              child:  TextButton(
                onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (builder) => accueil() ));
                }, 
                child: Text('Connexion', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),)),
            ),

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