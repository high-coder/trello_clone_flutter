import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trello_clone/screens/homeScreen/our_home_page.dart';


void main()=> runApp(TrelloRun());




class TrelloRun extends StatelessWidget {
  const TrelloRun({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: OurHome(),
    );
  }
}