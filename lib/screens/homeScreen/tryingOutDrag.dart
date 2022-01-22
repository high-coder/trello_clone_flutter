import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trello_clone/utils/data.dart';
import 'package:trello_clone/utils/staticValues.dart';

class TryingDragThing extends StatefulWidget {
  const TryingDragThing({Key? key}) : super(key: key);

  @override
  _TryingDragThingState createState() => _TryingDragThingState();
}

class _TryingDragThingState extends State<TryingDragThing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: 360,
          //height: 700,
          child: Column(
            children: [
              LongPressDraggable(
                data: 9,
                child: Container(
                  margin: EdgeInsets.all(7),
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: singleNodeColor,
                  ),
                  child: Text(
                    sampleNodes[0].title,
                    style: GoogleFonts.openSans(color: Colors.white),
                  ),
                ),
                feedback: Container(
                  margin: EdgeInsets.all(7),
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: singleNodeColor,
                  ),
                  child: Text(
                    sampleNodes[0].title,
                    style: GoogleFonts.openSans(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                  //width: 3,
                  height: 30,
//                    color: Colors.red,
                ),
                childWhenDragging: Container(
                  height: 43,
                  // margin: EdgeInsets.all(7),
                  // padding: EdgeInsets.all(5),
                  // decoration: BoxDecoration(
                  //   borderRadius: BorderRadius.circular(5),
                  //   color: singleNodeColor,
                  // ),
                  // child: Text(sampleNodes[0].title, style: GoogleFonts.openSans(color: Colors.white),),
                ),
              ),
              SizedBox(height: 21,),
              LongPressDraggable(
                data: 10,
                child: Container(
                  margin: EdgeInsets.all(7),
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: singleNodeColor,
                  ),
                  child: Text(
                    sampleNodes[0].title,
                    style: GoogleFonts.openSans(color: Colors.white),
                  ),
                ),
                feedback: Container(
                  margin: EdgeInsets.all(7),
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: singleNodeColor,
                  ),
                  child: Text(
                    sampleNodes[0].title,
                    style: GoogleFonts.openSans(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                  //width: 3,
                  height: 30,
//                    color: Colors.red,
                ),
                childWhenDragging: Container(
                  height: 43,
                  // margin: EdgeInsets.all(7),
                  // padding: EdgeInsets.all(5),
                  // decoration: BoxDecoration(
                  //   borderRadius: BorderRadius.circular(5),
                  //   color: singleNodeColor,
                  // ),
                  // child: Text(sampleNodes[0].title, style: GoogleFonts.openSans(color: Colors.white),),
                ),
              ),
              Container(
                height: 300,
                color: Colors.blue,
              ),
              Container(
                width: 100,
                height: 100,
                color: Colors.orange,
                child: DragTarget(
                  builder: (context, candidates,rejects) {
                    return Container(color: Colors.orange,width: 100,height: 100,);
                  },
                  onAccept: (data) {
                    print("this is the value that we have got from the things");
                    print(data);
                    // show this at this spot and then also remove it from the top spot
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
