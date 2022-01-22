import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:google_fonts/google_fonts.dart';
import 'package:measured_size/measured_size.dart';
import 'package:provider/provider.dart';
import 'package:trello_clone/models/list_tile_data_model.dart';
import 'package:trello_clone/provider/responsivenessHelper.dart';
import 'package:trello_clone/utils/data.dart';
import 'package:trello_clone/utils/staticValues.dart';

class ListDataAddSlivers extends StatefulWidget {
  const ListDataAddSlivers({Key? key}) : super(key: key);

  @override
  _ListDataAddSliversState createState() => _ListDataAddSliversState();
}

class _ListDataAddSliversState extends State<ListDataAddSlivers> {

  int i  = 0;
  @override
  initState() {
    ResponsiveHelp _respInstance = Provider.of<ResponsiveHelp>(context,listen:false);

    _respInstance.getHeightListView(sampleNodes);

  }

  double totalSize = 0;
  @override
  Widget build(BuildContext context) {
    ResponsiveHelp _respInstance = Provider.of<ResponsiveHelp>(context,listen:false);
    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      child: CustomScrollView(
        //scrollDirection: Axis.horizontal,
        //physics: NeverScrollableScrollPhysics(),
        slivers: [
          SliverPersistentHeader(
            floating: false,
            pinned: true,
            delegate: _SliverAppBarDelegate(
              listen: true,
              minHeight: 62,
              maxHeight: 62,
              child:  Container(
                decoration: BoxDecoration(
                  color: lightBlack,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  )
                ),
                
                child: Padding(
                  padding: const EdgeInsets.only(left:15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "TODO", style: GoogleFonts.openSans(
                        color: Colors.white,
                      ),
                      ),
                      IconButton(onPressed: () {}, icon: Icon(Icons.description, color: Colors.white,))
                    ],
                  ),
                ),
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Consumer<ResponsiveHelp>(
              builder: (context,_,__) {
                return Container(
                  color: lightBlack,
                  height: _respInstance.totalHeighti >  size.height-200 ? size.height -200:_respInstance.totalHeighti,
                  child: Builder(
                    builder: (context) {
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: sampleNodes.length,
                        itemBuilder: (context,index) {
                          return LongPressDraggable<ListTileSingleNodeModel>(
                            data: sampleNodes[index],
                            onDragStarted: () {
                              print("The dragging is kinda started");
                              _respInstance.updateAppBar(true);
                            },
                            onDragEnd: (value) {
                              _respInstance.updateAppBar(false);

                            },
                            onDragCompleted: () {
                              _respInstance.updateAppBar(false);

                            },
                            onDraggableCanceled: (velocity,offset) {
                              _respInstance.updateAppBar(false);
                            },
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
                            feedback: Material(
                              color: lightBlack.withOpacity(0.3),
                              child: Container(
                                margin: EdgeInsets.all(7),
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  // color: singleNodeColor.withOpacity(0.3),
                                ),
                                child: Text(
                                  sampleNodes[index].title,
                                  style: GoogleFonts.openSans(
                                    color: Colors.white,
                                    fontSize: 14,

                                  ),
                                  maxLines: 5,
                                ),
                                width: 300,
                                //height: 30,
//                    color: Colors.red,
                              ),
                            ),
                            child: Container(
                              margin: EdgeInsets.all(7),
                              padding: EdgeInsets.only(bottom: 5,left: 5,right: 5,top: 5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: singleNodeColor,
                              ),
                              child: Text(sampleNodes[index].title, style: GoogleFonts.openSans(color: Colors.white),),

                            ),
                          );
                        },
                      );
                    },
                  ),
                );
              },
            )
          ),
          // SliverList(
          //
          //
          //   delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
          //
          //     return Container(
          //       margin: EdgeInsets.all(7),
          //       padding: EdgeInsets.all(5),
          //       decoration: BoxDecoration(
          //         borderRadius: BorderRadius.circular(5),
          //         color: Color(0xff2c2c2e),
          //       ),
          //       child: Text("this is the sample text ", style: GoogleFonts.openSans(color: Colors.white),),
          //     );
          //   },
          //     childCount: 50,
          //
          //   )
          // ),
          SliverPersistentHeader(
            floating: false,
            pinned: true,
            delegate: _SliverAppBarDelegate(
              listen: true,
              minHeight: 62,
              maxHeight: 62,
              child:  Container(
                  decoration: BoxDecoration(
                      color: lightBlack,
                      borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                      )
                  ),

                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Icon(Icons.add, color: Color(0xff6db05d),),
                      Text("Add a card",style: GoogleFonts.openSans(color: addGreen),),
                      const Icon(Icons.add_a_photo, color: Colors.white,),
                    ],
                  ),
                )
              ),
            ),
          ),
        ],
      ),
    );
  }



  // ListView.builder(
  // itemBuilder: (context, index) => buildRow(index),
  // itemCount: trackList.length,
  // ),
  //
  // Widget buildRow(int index) {
  //   final track = trackList[index];
  //   ListTile tile = ListTile(
  //     title: Text('${track.getName()}'),
  //   );
  //   Draggable draggable = LongPressDraggable<Track>(
  //     data: track,
  //     axis: Axis.vertical,
  //     maxSimultaneousDrags: 1,
  //     child: tile,
  //     childWhenDragging: Opacity(
  //       opacity: 0.5,
  //       child: tile,
  //     ),
  //     feedback: Material(
  //       child: ConstrainedBox(
  //         constraints:
  //         BoxConstraints(maxWidth: MediaQuery.of(context).size.width),
  //         child: tile,
  //       ),
  //       elevation: 4.0,
  //     ),
  //   );
  //
  //   return DragTarget<Track>(
  //     onWillAccept: (track) {
  //       return trackList.indexOf(track) != index;
  //     },
  //     onAccept: (track) {
  //       setState(() {
  //         int currentIndex = trackList.indexOf(track);
  //         trackList.remove(track);
  //         trackList.insert(currentIndex > index ? index : index - 1, track);
  //       });
  //     },
  //     builder: (BuildContext context, List<Track> candidateData,
  //         List<dynamic> rejectedData) {
  //       return Column(
  //         children: <Widget>[
  //           AnimatedSize(
  //             duration: Duration(milliseconds: 100),
  //             vsync: this,
  //             child: candidateData.isEmpty
  //                 ? Container()
  //                 : Opacity(
  //               opacity: 0.0,
  //               child: tile,
  //             ),
  //           ),
  //           Card(
  //             child: candidateData.isEmpty ? draggable : tile,
  //           )
  //         ],
  //       );
  //     },
  //   );
  // }

}
class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  Widget? newChild;
  bool? listen = false;

  _SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
    this.newChild,
    this.listen,
  });

  final double minHeight;
  double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => math.max(maxHeight, minHeight);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    //if(shrinkOffset)/
    // print("===============");
    // print(shrinkOffset);
    // print("===============");

    //print(shrinkOffset.);
    //if()

    if (listen == false) {
      return LayoutBuilder(builder: (context, constraints) {
        print(constraints.maxWidth);
        print("===============");
        print(constraints.maxHeight);

        if (constraints.maxHeight > 150) {
          return SizedBox.expand(child: child);
        } else {
          //maxHeight = 60;
          return SizedBox.expand(child: newChild);
        }
      });
    } else {
      return SizedBox.expand(child: child);
    }

    // return new SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}