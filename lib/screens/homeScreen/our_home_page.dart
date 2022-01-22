import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:trello_clone/models/list_tile_data_model.dart';
import 'package:trello_clone/provider/currentState.dart';
import 'package:get/get.dart';
import 'package:trello_clone/provider/responsivenessHelper.dart';
import 'package:trello_clone/screens/homeScreen/localWidgets/list_data_add.dart';
import 'package:trello_clone/utils/data.dart';
import 'package:trello_clone/utils/staticValues.dart';
import '../page2_demo.dart';
import 'localWidgets/list_data_add_v2_slivers.dart';

class OurHome extends StatefulWidget {
  const OurHome({Key? key}) : super(key: key);

  @override
  _OurHomeState createState() => _OurHomeState();
}

class _OurHomeState extends State<OurHome> {

  bool onDragging = false;

  @override
  Widget build(BuildContext context) {
    ResponsiveHelp _responsiveHelp = Provider.of<ResponsiveHelp>(context,listen:false);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.lightBlue.withOpacity(0.5),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 70,
              decoration: BoxDecoration(
                color: staticBlue
              ),
              child: Consumer<ResponsiveHelp>(
                builder: (context,_,__) {
                  switch(_responsiveHelp.appBarState) {
                    case(AppBarState.Name):
                      return Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.arrow_back_ios,color: ourWhite,),
                            onPressed: () {},
                          ),
                          // title of the page
                          Text("Name of the Board", style: GoogleFonts.openSans(fontSize: 15,color:ourWhite),)
                        ],
                      );
                    case(AppBarState.Drag):
                      return DragTarget<ListTileSingleNodeModel>(
                        builder: (context, candidates,rejects) {
                          return Container(
                            width: 150,
                            height: 30,
                            decoration: BoxDecoration(
                                color: addGreen,
                                borderRadius: BorderRadius.circular(3)
                            ),
                            child: Center(child: Text("Drag here to archive",style: GoogleFonts.openSans(color: ourWhite,fontSize: 15),)),
                          );

                        },
                        onAccept: (data) {
                          _responsiveHelp.removeNodeFromList(instance: data, listToRemoveFrom: sampleNodes);
                          //sampleNodes.remove(data);
                          print("this is the value that we have got from the things");
                          print(data);
                          // show this at this spot and then also remove it from the top spot
                        },
                      );
                    case (AppBarState.AddCard):
                      return Container(
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                _responsiveHelp.showAddCardFunc(false);
                              },
                              icon: Icon(Icons.cancel_outlined,color: ourWhite,),
                            ),
                            SizedBox(width: 20,),
                            Text("Add Card...",style: GoogleFonts.openSans(fontSize: 15,color: ourWhite),),
                            Spacer(flex:1),

                            // enable this when the value of the text controller is not empty
                            Consumer<ResponsiveHelp>(
                              builder:(context,_,__) {
                                return IconButton(
                                  icon: Icon(Icons.add,color: _responsiveHelp.enableSaving == true ? ourWhite : ourWhite.withOpacity(0.3),),
                                  onPressed: ()  {
                                    if(_responsiveHelp.enableSaving) {

                                      //  TODO : here using the text painter figure out the total height that will be required by this text and add that
                                      sampleNodes.add(ListTileSingleNodeModel(index: sampleNodes.length,heightOfNode: 50,title: _responsiveHelp.cardName.text));
                                      _responsiveHelp.totalHeighti +=50;
                                      _responsiveHelp.cardName.clear();
                                      _responsiveHelp.showAddCardFunc(false);

                                    } else {
                                      // do nothing.......
                                    }
                                  },
                                );
                              },
                            )
                          ],
                        ),
                      );
                    default:
                      return Container();
                  }


                },
              )
            ),
            Expanded(
              flex: 20,
              child: Container(

                padding: EdgeInsets.all(20),
                child: ListDataAddSlivers(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
