// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:trello_clone/provider/responsivenessHelper.dart';
// import 'package:trello_clone/utils/staticValues.dart';
//
// Widget appBar() {
//   return  Container(
//     child: Row(
//       children: [
//         IconButton(
//           onPressed: () {
//             _responsiveHelp.showAddCardFunc(false);
//           },
//           icon: Icon(Icons.cancel_outlined,color: ourWhite,),
//         ),
//         SizedBox(width: 20,),
//         Text("Add Card...",style: GoogleFonts.openSans(fontSize: 15,color: ourWhite),),
//         Spacer(flex:1),
//
//         // enable this when the value of the text controller is not empty
//         Consumer<ResponsiveHelp>(
//           builder:(context,_,__) {
//             return IconButton(
//               icon: Icon(Icons.add,color: _responsiveHelp.enableSaving == true ? ourWhite : ourWhite.withOpacity(0.3),),
//               onPressed: ()  {
//                 if(_responsiveHelp.enableSaving) {
//
//                   //  TODO : here using the text painter figure out the total height that will be required by this text and add that
//                   sampleNodes.add(ListTileSingleNodeModel(index: sampleNodes.length,heightOfNode: 50,title: _responsiveHelp.cardName.text));
//                   _responsiveHelp.totalHeighti +=50;
//                   _responsiveHelp.cardName.clear();
//                   _responsiveHelp.showAddCardFunc(false);
//
//                 } else {
//                   // do nothing.......
//                 }
//               },
//             );
//           },
//         )
//       ],
//     ),
//   );
// }