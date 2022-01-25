import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:trello_clone/models/commentsModel.dart';
import 'package:trello_clone/provider/currentState.dart';
import 'package:trello_clone/provider/responsivenessHelper.dart';
import 'package:trello_clone/utils/staticValues.dart';

class BottomCommentBar extends StatefulWidget {
  BottomCommentBar({Key? key}) : super(key: key);

  @override
  State<BottomCommentBar> createState() => _BottomCommentBarState();
}

class _BottomCommentBarState extends State<BottomCommentBar> {
  TextEditingController _commentController = TextEditingController();
  FocusNode _commentFocus = FocusNode();

  bool enable = false;
  @override
  Widget build(BuildContext context) {
    ResponsiveHelp _respHelp =
    Provider.of<ResponsiveHelp>(context, listen: false);
    Size size = MediaQuery.of(context).size;
    CurrentState _instance = Provider.of<CurrentState>(context,listen:false);
    return Container(
      margin: EdgeInsets.all(5),
      height: size.height/12,
      color: const Color(0xff252525),
      child: Row(
        children: [
          const Spacer(flex:1),

          const Expanded(
            flex:2,
            child: CircleAvatar(
              radius: 50,
            ),
          ),
          Spacer(flex:1),
          Expanded(
            flex: 12,
            child: TextField(
              focusNode: _commentFocus,
              controller: _commentController,
              style: GoogleFonts.openSans(color: ourWhite,fontSize: 14),
              onTap: () {
                // Scrollable.ensureVisible(dataKey.currentContext!);
                _instance.showBottomCommentBarFunc(true);
              },
              onChanged: (value) {
                if(_commentController.text.isNotEmpty) {
                  // enable the comment icon
                  if(enable!=true) {
                    setState(() {
                      enable = true;
                    });
                  }

                } else {
                  // disable the comment icon
                  if(enable!=false) {
                    setState(() {
                      enable = false;
                    });
                  }

                }

              },
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  icon:Icon(Icons.send,color: enable == true?ourWhite:const Color(0xff8b8b8b),),
                  onPressed: () {
                    if(_commentController.text.isNotEmpty){
                      if(_instance.currentUser.comments!=null) {
                        _instance.currentUser.comments?.add(CommentModel(comment: _commentController.text, dateTime:DateTime.now()));
                      } else{
                        _instance.currentUser.comments = [];
                        _instance.currentUser.comments?.add(CommentModel(comment: _commentController.text, dateTime:DateTime.now()));
                      }

                      // clearing up data for the next node to work
                      _commentController.clear();
                      _commentFocus.unfocus();
                    }
                  },
                ),
                hintStyle: GoogleFonts.openSans(fontSize: 12,color:const Color(0xff8b8b8b)),
                hintText: "Add comment...",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(
                        color: Color(0xff161616),
                        width: 2
                    )
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(
                        color: Color(0xff161616),
                        width: 2
                    )
                ),
                disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide:const BorderSide(
                        color: Color(0xff161616),
                        width: 2
                    )
                ),

              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: IconButton(
              icon: Icon(Icons.attach_file_sharp, color: ourWhite,),
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }
}
