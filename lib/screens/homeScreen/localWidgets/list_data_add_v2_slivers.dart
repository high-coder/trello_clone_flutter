import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';


import 'package:google_fonts/google_fonts.dart';
import 'package:measured_size/measured_size.dart';
import 'package:provider/provider.dart';
import 'package:trello_clone/models/list_tile_data_model.dart';
import 'package:trello_clone/provider/currentState.dart';
import 'package:trello_clone/provider/responsivenessHelper.dart';
import 'package:trello_clone/screens/DescriptionPage/desp_main_page.dart';
import 'package:trello_clone/screens/homeScreen/localWidgets/sliver_delagate.dart';
import 'package:trello_clone/utils/data.dart';
import 'package:trello_clone/utils/staticValues.dart';

class ListDataAddSlivers extends StatefulWidget {
  const ListDataAddSlivers({Key? key}) : super(key: key);

  @override
  _ListDataAddSliversState createState() => _ListDataAddSliversState();
}

class _ListDataAddSliversState extends State<ListDataAddSlivers> {
  int i = 0;
  FocusNode  _cardFocus = FocusNode();

  @override
  void initState() {
    ResponsiveHelp _respInstance =
        Provider.of<ResponsiveHelp>(context, listen: false);

    _respInstance.getHeightListView(sampleNodes);
  }

  //bool _respInstance.showAddCard = false;
  double totalSize = 0;

  @override
  Widget build(BuildContext context) {
    ResponsiveHelp _respInstance =
        Provider.of<ResponsiveHelp>(context, listen: false);
    Size size = MediaQuery.of(context).size;

    CurrentState _instance = Provider.of<CurrentState>(context,listen: false);
    return Container(
      width: size.width,
      child: CustomScrollView(
        //scrollDirection: Axis.horizontal,
        //physics: NeverScrollableScrollPhysics(),
        slivers: [
          SliverPersistentHeader(
            floating: false,
            pinned: true,
            delegate: SliverAppBarDelegate(
              listen: true,
              minHeight: 62,
              maxHeight: 62,
              child: Container(
                decoration: BoxDecoration(
                    color: lightBlack,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    )),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "TODO",
                        style: GoogleFonts.openSans(
                          color: Colors.white,
                        ),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.description,
                            color: Colors.white,
                          ))
                    ],
                  ),
                ),
              ),
            ),
          ),

          SliverToBoxAdapter(child: Consumer<ResponsiveHelp>(
            builder: (context, _, __) {
              return Container(
                color: lightBlack,
                height: _respInstance.totalHeighti > size.height - 200
                    ? size.height - 200
                    : _respInstance.totalHeighti,
                child: Builder(
                  builder: (context) {
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: sampleNodes.length,
                      itemBuilder: (context, index) {
                        if (index != sampleNodes.length - 1) {
                          return LongPressDraggable<ListTileSingleNodeModel>(
                            data: sampleNodes[index],
                            onDragStarted: () {
                              print("The dragging is kinda started");
                              _respInstance.updateAppBar(AppBarState.Drag);
                            },
                            onDragEnd: (value) {
                              _respInstance.updateAppBar(AppBarState.Name);
                            },
                            onDragCompleted: () {
                              _respInstance.updateAppBar(AppBarState.Name);
                            },
                            onDraggableCanceled: (velocity, offset) {
                              _respInstance.updateAppBar(AppBarState.Name);
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
                            child: GestureDetector(
                              onTap: () {
                                _instance.currentUser = sampleNodes[index];
                                print("this istat");
                                Navigator.of(context).push(MaterialPageRoute(builder: (context) => DescriptionPage()));
                              },
                              child: Container(width:size.width,
                                margin: EdgeInsets.all(7),
                                padding: EdgeInsets.only(
                                    bottom: 5, left: 5, right: 5, top: 5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: singleNodeColor,
                                ),

                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Consumer<CurrentState>(
                                      builder: (context,_,__) {

                                        print("tinis inside here this is getting serious now and i dont know what to doi ");

                                        if(sampleNodes[index].labels == null) {
                                          return Container();

                                        }
                                        else if (sampleNodes[index].labels?.isNotEmpty ??  false) {
                                          return Wrap(
                                            direction: Axis.horizontal,
                                            children: [
                                              ...List.generate(sampleNodes[index].labels?.length ?? 0, (index2) {
                                                return Container(
                                                  margin: EdgeInsets.all(3),
                                                  decoration: BoxDecoration(
                                                    color: colorsModel[sampleNodes[index].labels![index2]].color,
                                                    borderRadius: BorderRadius.circular(2)
                                                  ),
                                                  height: 23,
                                                  width: 50,
                                                );
                                              })
                                            ],
                                          );

                                        } else {
                                          return Container();
                                        }
                                      },
                                    ),
                                    Container(

                                      child: Text(
                                        sampleNodes[index].title,
                                        style:
                                            GoogleFonts.openSans(color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        } else {
                          return LayoutBuilder(builder: (context,constraints) {
                            return Container(
                              width: constraints.maxWidth,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  LongPressDraggable<ListTileSingleNodeModel>(
                                    data: sampleNodes[index],
                                    onDragStarted: () {
                                      print("The dragging is kinda started");
                                      _respInstance.updateAppBar(AppBarState.Drag);
                                    },
                                    onDragEnd: (value) {
                                      _respInstance.updateAppBar(AppBarState.Name);
                                    },
                                    onDragCompleted: () {
                                      _respInstance.updateAppBar(AppBarState.Name);
                                    },
                                    onDraggableCanceled: (velocity, offset) {
                                      _respInstance.updateAppBar(AppBarState.Name);
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
                                      width: constraints.maxWidth,
                                      margin: EdgeInsets.all(7),
                                      padding: EdgeInsets.only(
                                          bottom: 5, left: 5, right: 5, top: 5),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: singleNodeColor,
                                      ),
                                      child: Text(
                                        sampleNodes[index].title,
                                        style: GoogleFonts.openSans(
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                  _respInstance.showAddCard == true?
                                      Container(
                                        width: constraints.maxWidth,
                                        margin: const EdgeInsets.only(left:7,bottom: 12,top: 7,right: 7),
                                        padding: const EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),
                                          color: lightGreyAddCard,
                                        ),
                                        child: TextField(
                                          controller: _respInstance.cardName,
                                          onChanged: (value) {
                                            if(_respInstance.cardName.text.length>=1) {
                                              _respInstance.enableSavingFunc(true);
                                            } else {
                                              _respInstance.enableSavingFunc(false);
                                            }
                                          },
                                          focusNode: _cardFocus,
                                          decoration: InputDecoration(
                                            hintText: "Card name",
                                            hintStyle: GoogleFonts.openSans(
                                              fontSize: 16,
                                              color: hintColor,

                                            ),
                                            border: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: addGreen,
                                              )
                                            ),
                                            disabledBorder:  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: addGreen,
                                                  width: 5
                                                )
                                            ),
                                            focusedBorder:  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: addGreen,
                                                  width: 3
                                                )
                                            ),
                                          ),
                                        ),

                                      ) : Container()
                                ],
                              ),
                            );
                          });
                        }
                      },
                    );
                  },
                ),
              );
            },
          )),
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
            delegate: SliverAppBarDelegate(
              listen: true,
              minHeight: 62,
              maxHeight: 62,
              child: Consumer<ResponsiveHelp>(
                builder: (context,_,__) {
                  if(_respInstance.appBarState !=AppBarState.AddCard) {
                    return Container(
                      decoration: BoxDecoration(
                          color: lightBlack,
                          borderRadius: const BorderRadius.only(
                            bottomRight: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                          )),
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              flex: 3,
                              child: FlatButton(
                                focusColor: Colors.orange,
                                hoverColor: Colors.red,
                                //splashColor: Colors.green,
                                highlightColor: lightBlue,
                                // this is the color that is shown when the user holds the touch on the button
                                onPressed: () {
                                  _respInstance.showAddCardFunc(true);
                                  _cardFocus.requestFocus();
                                  //setState(() {});
                                },
                                child: Container(
//                            color: lightBlack,
                                  child: Row(
                                    // /mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      const Icon(
                                        Icons.add,
                                        color: Color(0xff6db05d),
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Text(
                                        "Add card",
                                        style: GoogleFonts.openSans(
                                            color: addGreen, fontSize: 17),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const Expanded(
                                flex: 1,
                                child: Icon(
                                  Icons.add_a_photo,
                                  color: Colors.white,
                                )),
                          ],
                        ),
                      ),);
                  }
                  else {
                    return Container();
                  }

                },
              )
                ,
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


