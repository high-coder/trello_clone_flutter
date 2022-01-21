import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:trello_clone/provider/currentState.dart';
import 'package:get/get.dart';
import 'package:trello_clone/screens/homeScreen/localWidgets/list_data_add.dart';
import '../page2_demo.dart';
import 'localWidgets/list_data_add_v2_slivers.dart';

class OurHome extends StatefulWidget {
  const OurHome({Key? key}) : super(key: key);

  @override
  _OurHomeState createState() => _OurHomeState();
}

class _OurHomeState extends State<OurHome> {


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(

          padding: EdgeInsets.all(30),
          child: ListDataAddSlivers(),
        ),
      ),
    );
  }
}
