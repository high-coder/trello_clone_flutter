import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:trello_clone/models/commentsModel.dart';
import 'package:trello_clone/provider/currentState.dart';
import 'package:trello_clone/utils/staticValues.dart';

class CommentWidget extends StatefulWidget {
  late CommentModel commentThing;

  CommentWidget({required this.commentThing});

  @override
  State<CommentWidget> createState() => _CommentWidgetState();
}

class _CommentWidgetState extends State<CommentWidget> {
  TextEditingController _commentController = TextEditingController();

  FocusNode _commentFocus = FocusNode();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _commentController.text = widget.commentThing.comment;
  }

  @override
  Widget build(BuildContext context) {
    CurrentState _instance = Provider.of<CurrentState>(context, listen:false);
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10),
      child: Row(
        //mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Expanded(
            flex: 2,
            child: CircleAvatar(
              radius: 30,
            ),
          ),
          Expanded(
            flex: 12,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Deepak Mittal",
                          style: GoogleFonts.openSans(
                              color: ourWhite, fontSize: 15),
                        ),
                      ),
                      PopupMenuButton(
                        color: lightBlack,
                        child: Icon(
                          Icons.menu,
                          color: ourWhite,
                        ),
                        itemBuilder: (context) {
                          return List.generate(1, (index) {
                            return PopupMenuItem(
                              onTap: () {
                                _instance.currentUser.comments?.remove(widget.commentThing);
                              },
                              textStyle: GoogleFonts.openSans(fontSize: 12,color:ourWhite),
                              height: 20,
                              child: Container(
                                color: lightBlack,
                                height: 20,

                                  child: Text('Delete')
                              ),
                            );
                          });
                        },
                      ),
                    ],
                  ),
                  Container(
                    color: Color(0xff252525),
                    child: TextField(
                      focusNode: _commentFocus,
                      controller: _commentController,
                      style:
                          GoogleFonts.openSans(color: ourWhite, fontSize: 14),
                      onTap: () {
                        _instance.showBottomCommentBarFunc(false);
                        // Scrollable.ensureVisible(dataKey.curentContext!);
                      },
                      onChanged: (value) {
                        // when the user changes the line
                      },
                      maxLines: 15,
                      minLines: 1,
                      decoration: InputDecoration(
                        isDense: true,

                        fillColor: Color(0xff252525),
                        focusColor: Color(0xff252525),
                        //hintStyle: GoogleFonts.openSans(fontSize: 12,color:const Color(0xff8b8b8b)),
                        //hintText: "Add comment...",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Color(0xff161616),
                              width: 1,
                            )),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                                color: Color(0xff161616), width: 1)),
                        disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                                color: Color(0xff161616), width: 1)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  //Text("${DateTime.now().month}, ${DateTime.now().year} at ${DateTime.now().hour} : ${DateTime.now().minute}",style: GoogleFonts.poppins(color: ourWhite,fontSize: 15),)
                  Text("${widget.commentThing.dateTime}",
                      style: GoogleFonts.poppins(color: ourWhite, fontSize: 15))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
