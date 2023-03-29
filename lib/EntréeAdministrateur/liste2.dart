class ToDo{
  String? id;
  String? Text;
  String? tache;




ToDo({
   required this.id,
   required this.Text,
   required this.tache,
});

 static List<ToDo> todolist(){
  return [
    ToDo(id: '01', Text: 'Johanna Shein', tache: '',),
    ToDo(id: '02', Text: 'Awa konaté', tache: '',),
   
  ];

 }
}