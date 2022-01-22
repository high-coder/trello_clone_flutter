import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trello_clone/models/list_tile_data_model.dart';

class ResponsiveHelp extends ChangeNotifier{


  double totalHeighti  = 0;
  // returns the correct space that might be needed by the text field to do its thing
  double getHeightListView(List data){
    double totalHeight = 0;
    for (var element in data) {
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
      totalHeight+=(tp.height+24);  // this plus 24 is estimate of the padding and the margin that is applied to the text to increase the height of the container
    }
    totalHeighti = totalHeight;
    return totalHeight;
  }

  bool showArchiveThing = false;

  updateAppBar(bool local) {
    showArchiveThing = local;
    notifyListeners();
  }

  removeNodeFromList(
      { required ListTileSingleNodeModel instance,
      required List<ListTileSingleNodeModel> listToRemoveFrom}) {
    listToRemoveFrom.remove(instance);
    getHeightListView(listToRemoveFrom);
    notifyListeners();
  }
}