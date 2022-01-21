import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:trello_clone/provider/currentState.dart';
import 'package:trello_clone/screens/homeScreen/our_home_page.dart';
import 'package:trello_clone/screens/page2_demo.dart';


void main()=> runApp(TrelloRun());




class TrelloRun extends StatelessWidget {
  const TrelloRun({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CurrentState())
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: OurHome(),
        //home: Page2(),
      ),
    );
  }
}
