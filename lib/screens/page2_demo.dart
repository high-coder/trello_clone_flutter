import 'package:flutter/material.dart';
import 'package:trello_clone/provider/currentState.dart';

import 'homeScreen/localWidgets/list_data_add_v2_slivers.dart';

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: Container(
        //width: 1000,
        child: ListView(
          //shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          addAutomaticKeepAlives: true,
          children: [
            Container(
              padding: EdgeInsets.all(30),
              child: ListDataAddSlivers(),
            ),Container(

              padding: EdgeInsets.all(30),
              child: ListDataAddSlivers(),
            ),Container(

              padding: EdgeInsets.all(30),
              child: ListDataAddSlivers(),
            ),Container(

              padding: EdgeInsets.all(30),
              child: ListDataAddSlivers(),
            ),Container(

              padding: EdgeInsets.all(30),
              child: ListDataAddSlivers(),
            ),
          ],
        ),
      ),
    );
  }
}
