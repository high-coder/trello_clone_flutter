import 'package:trello_clone/models/list_tile_data_model.dart';

class SingleListModel {

  late String titleOfBoard;
  late List<ListTileSingleNodeModel> wholeList = [];



  SingleListModel({required this.titleOfBoard,required this.wholeList});


}