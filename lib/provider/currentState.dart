import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trello_clone/screens/page2_demo.dart';

class CurrentState{

  static final CurrentState _instance = CurrentState._internal();

  factory CurrentState() {
    return _instance;
  }


  CurrentState._internal() {
    // some logic
  }
  late Size dimensions;
  int index= 1;


  letsNavigate(BuildContext context,dynamic pageName) {
    //Navigator.of(context).push(MaterialPageRoute(builder: (context) => pageName()));
  }
}