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
      
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex:2,
              child: Container(
                decoration: BoxDecoration(
                  color: staticBlue
                ),
                child: Consumer<ResponsiveHelp>(
                  builder: (context,_,__) {
                    if(_responsiveHelp.showArchiveThing== false) {
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
                    } else {
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
                    }
                  },
                )
              ),
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
