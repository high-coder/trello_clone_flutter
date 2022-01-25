import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trello_clone/models/list_tile_data_model.dart';
import 'package:trello_clone/screens/page2_demo.dart';

class CurrentState extends ChangeNotifier{


  /// Old code not in use this was for the singletons in flutter don't think
  /// i am gonna use this as provider does this for us automatically
  // static final CurrentState _instance = CurrentState._internal();
  //
  // factory CurrentState() {
  //   return _instance;
  // }
  //
  //
  // CurrentState._internal() {
  //   // some logic
  // }
  // late Size dimensions;
  // int index= 1;
  //
  //
  // letsNavigate(BuildContext context,dynamic pageName) {
  //   //Navigator.of(context).push(MaterialPageRoute(builder: (context) => pageName()));
  // }

  late ListTileSingleNodeModel currentUser;
  late String appBarTitle;

  bool showBottomCommentBar = true;

  showBottomCommentBarFunc(bool local) {
    showBottomCommentBar = local;

    notifyListeners();
  }



  userSelectedANode({required ListTileSingleNodeModel instance}) {
    currentUser = instance;
    appBarTitle = instance.title;
  }

  updateAppBarTitle(bool isTitle) {

    if(isTitle) {
      appBarTitle = "Edit Title...";

    }
    //appBarTitle = title;
    notifyListeners();
  }



}