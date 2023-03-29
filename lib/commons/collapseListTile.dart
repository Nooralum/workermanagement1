import 'package:flutter/material.dart';

class CollapseList extends StatefulWidget {
  const CollapseList(
        {super.key,
         required this.icon, 
         required this.title, 
         required this.animationController, 
         this.isSelected = false, 
         this.onTap});

  final String title;
  final IconData icon;
  final AnimationController animationController;
  final bool isSelected;
  final void onTap;


  @override
  State<CollapseList> createState() => _CollapseListState();
}

class _CollapseListState extends State<CollapseList> {
   
     late Animation<double> widthAnimation, sizedBoxAnimation;

   @override
  void initState() {
    super.initState();
    widthAnimation = Tween<double>(begin: 80, end: 220)
        .animate(widget.animationController);
    sizedBoxAnimation = Tween<double>(begin: 10, end: 0)
        .animate(widget.animationController);    
  }


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        widget.onTap;
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16.0)),
          color: widget.isSelected ? Colors.transparent.withOpacity(0.3) : Colors.black
        ),
        margin: EdgeInsets.symmetric(horizontal: 8.0),
        padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0 ),
        child: Row(
          children: [
            Icon(widget.icon, color: Colors.white, size: 38.0),
            SizedBox(width: sizedBoxAnimation.value),
            (widthAnimation.value >= 200) 
                ? Text(widget.title, style: widget.isSelected 
                    ?  TextStyle(color: Colors.black)  
                    :  TextStyle(color: Colors.white),)
                :Container()
      
          ],
        ),
      ),
    );
  }
}