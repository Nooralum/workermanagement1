import 'package:flutter/material.dart';
import 'package:workermanagement1/page2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: ''),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    var maQuerry = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
             Container(
              height: MediaQuery.of(context).size.height,
              child: Image(image: AssetImage('assets/images/cultureItem.jpg'), fit: BoxFit.cover,),
        ),
          
          Padding(
            padding: EdgeInsets.all(90.0),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                  const Text(
                    'Bienvenue sur',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(height: 15,),
                 const CircleAvatar(
                  radius: 90,
                   backgroundImage: AssetImage('assets/images/logo.png') ,
                ),
                SizedBox(height: 100,),
                Text('\r \r Worker Management', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold, ),),
      
              SizedBox(height: 100,),
      
              Container(
                width: 330,
                height: 78,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Color.fromARGB(255, 45, 184, 49),
                ),
                child:  TextButton(
                  onPressed: (){
                     Navigator.push(context, MaterialPageRoute(builder: (builder) => entree() ));
                  }, 
                  child: Text('Démarrer', style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Colors.black),)),
              ),
               
      
      
              ],
            
            ),
          )
      
          ],
        ),
      )
     
    );
      
  }
}
