import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:trello_clone/provider/currentState.dart';
import 'package:get/get.dart';
import '../page2_demo.dart';

class OurHome extends StatefulWidget {
  const OurHome({Key? key}) : super(key: key);

  @override
  _OurHomeState createState() => _OurHomeState();
}

class _OurHomeState extends State<OurHome> {

  CurrentState _instance = CurrentState();

  @override
  Widget build(BuildContext context) {
    _instance.index = 2;

    print(_instance.index);
    CurrentState _instance2 = CurrentState();
    print(_instance2.index);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  Get.to(()=> Page2());
                  //_instance.letsNavigate(context, Page2());
                },
                child: Container(
                  height: 100,
                  width: 100,
                  child: Text("Take me to the next page dude"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
