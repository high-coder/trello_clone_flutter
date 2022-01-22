/// V1 -- just create the basic functionality that is save the title of the card and then
/// save the index in which the user has dragged it or something

class ListTileSingleNodeModel{
  late String title;
  late int index;   // this is the index in the list where it should be shown to the user
  double ?heightOfNode;
  ListTileSingleNodeModel({required this.index,required this.title,this.heightOfNode});
}