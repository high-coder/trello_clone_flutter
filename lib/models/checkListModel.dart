import 'package:trello_clone/models/singleItemCheckList.dart';

class CheckListModel {
  String title;
  List<SingleItemCheckList> itemsTotal;
  CheckListModel({required this.itemsTotal,required this.title});
}