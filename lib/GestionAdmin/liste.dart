class ToDo{
  String? id;
  String? Text;
  String? Code;




ToDo({
   required this.id,
   required this.Text,
   required this.Code,
});

 static List<ToDo> todolist(){
  return [
    ToDo(id: '01', Text: 'Johanna Shein', Code: '1111',),
    ToDo(id: '02', Text: 'Awa konaté', Code: '2222',),
   
  ];

 }
}

