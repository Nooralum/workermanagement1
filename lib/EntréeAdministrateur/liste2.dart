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
    ToDo(id: '01', Text: 'Awa konaté', tache: 'ramassage',),
  ];

 }
}