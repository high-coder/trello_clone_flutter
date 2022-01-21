import 'package:flutter/material.dart';
import 'package:trello_clone/provider/currentState.dart';

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CurrentState _instance = CurrentState();
    print(_instance.index);
    return Scaffold(
      body: Container(
        child: Text("This is the container"),
      ),
    );
  }
}
