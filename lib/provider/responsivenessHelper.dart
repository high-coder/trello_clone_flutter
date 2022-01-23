import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trello_clone/models/list_tile_data_model.dart';
import 'package:trello_clone/utils/data.dart';



enum AppBarState {
  Name,
  Drag,
  AddCard,
}

enum AppBarStateDesp{
  Name,
  AddDesp
}

class ResponsiveHelp extends ChangeNotifier{

  TextEditingController cardName = TextEditingController();


  AppBarStateDesp appBarStateDesp = AppBarStateDesp.Name;
  AppBarState appBarState = AppBarState.Name;
  double totalHeighti  = 0;
  bool showTextField= false;



  // returns the correct space that might be needed by the text field to do its thing
  double getHeightListView(List data){
    double totalHeight = 0;
    for (var element in sampleNodes) {
      var span2 = TextSpan(
        text: element.title,
        style: GoogleFonts.openSans(
          fontSize: 14,
          color: Colors.white,
        ),

      );

      var tp = TextPainter(
        text: span2,
        textAlign: TextAlign.left,
        textDirection: TextDirection.ltr,
      );
      tp.layout(maxWidth: 250);
      //print("This is the height that is ${tp.height}");
      if(tp.height>50) {
        totalHeight+=(tp.height+5);
        element.heightOfNode=tp.height+5;
      }else {
        totalHeight+=(tp.height+24);  // this plus 24 is estimate of the padding and the margin that is applied to the text to increase the height of the container
        element.heightOfNode = tp.height + 24;

      }
    }
    totalHeighti = totalHeight;
    return totalHeight;
  }

  bool showArchiveThing = false;
  bool showAddCard = false;
  bool showDesAppBar = false;


  showDesAppBarFunc(bool local) {
    if(showDesAppBar!=local) {

      // waiting for the setstate default of the screen to be called
      Future.delayed(Duration(milliseconds: 120)).then((value) {
        notifyListeners();
      });
    }
    showDesAppBar = local;
  }

  showAddCardFunc(bool local) {
    showAddCard = local;
    if(showAddCard  == true) {
      appBarState = AppBarState.AddCard;
    } else{
      appBarState = AppBarState.Name;
    }
    notifyListeners();
  }
  updateAppBar(AppBarState data) {
    //showArchiveThing = local;
    appBarState=data;

    notifyListeners();
  }

  removeNodeFromList(
      { required ListTileSingleNodeModel instance,
      required List<ListTileSingleNodeModel> listToRemoveFrom}) {
    listToRemoveFrom.remove(instance);
    totalHeighti-=instance.heightOfNode!;
    getHeightListView(listToRemoveFrom);
    notifyListeners();
  }

  bool enableSaving = false;
  enableSavingFunc(bool local) {
    if(enableSaving == local) {
      // do nothing mate
    } else {
      enableSaving = local;
      notifyListeners();
    }

  }

}