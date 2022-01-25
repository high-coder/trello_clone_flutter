import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:trello_clone/models/list_tile_data_model.dart';
import 'package:trello_clone/provider/currentState.dart';
import 'package:trello_clone/provider/responsivenessHelper.dart';
import 'package:trello_clone/screens/homeScreen/localWidgets/sliver_delagate.dart';
import 'package:trello_clone/utils/data.dart';
import 'package:trello_clone/utils/staticValues.dart';

import 'localWidgets/bottom_comment_bar.dart';
import 'localWidgets/comment_widget.dart';

class DescriptionPage extends StatefulWidget {



  const DescriptionPage({Key? key}) : super(key: key);

  @override
  _DescriptionPageState createState() => _DescriptionPageState();
}

class _DescriptionPageState extends State<DescriptionPage> {


  late ScrollController _controller;
  late ScrollController _controllerTextField;
  FocusNode _titleFocus = FocusNode();
  FocusNode _despFocus = FocusNode();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _descriptonController = TextEditingController();
  String titleAppBar =
      "A very long long text shfh dsafl lorem ikf sdfgdfbgmy name isk and i am not a tereiist and this "
      "is one of the things that i have to do in order"
      " to make this trello project adn this is why I am dont ";
  final dataKey = GlobalKey();

  @override
  void initState() {
    // TODO: implement initState
    _controller = ScrollController();
    _controllerTextField = ScrollController();
    
   // _controllerTextField.addListener(_scrollListenerText);
    // _controller.addListener(_scrollListener);
    CurrentState _instance = Provider.of<CurrentState>(context,listen:false);

    _nameController.text = _instance.currentUser.title;
    ResponsiveHelp _respHelp =
    Provider.of<ResponsiveHelp>(context, listen: false);
    _respHelp.appBarStateDesp = AppBarStateDesp.Name;

    super.initState();
  }

  // want to check if the user is going down or up
  _scrollListenerText() {
    //_controller.createScrollPosition(AlwaysScrollableScrollPhysics(), , _controller.position);

  }
  
  String message = " ";
  _scrollListener() {
    if (_controller.offset >= _controller.position.maxScrollExtent &&
        !_controller.position.outOfRange) {
      // setState(() {
      //   message = "reach the bottom";
      // });
    }
    if (_controller.offset <= _controller.position.minScrollExtent &&
        !_controller.position.outOfRange) {
      // setState(() {
      //   message = "reach the top";
      // });
    }

    print(message);
  }

  moveUp() {
    _controller.animateTo(_controller.offset+20, duration: Duration(milliseconds: 300), curve: Curves.linear,);
  }

  @override
  Widget build(BuildContext context) {
    ResponsiveHelp _respHelp =
        Provider.of<ResponsiveHelp>(context, listen: false);
    Size size = MediaQuery.of(context).size;
    CurrentState _instance = Provider.of<CurrentState>(context,listen:false);
    print("this is whole rebuilding");
    return Scaffold(


      resizeToAvoidBottomInset: _instance.showBottomCommentBar,
      backgroundColor:const Color(0xff222222),
        // bottomNavigationBar: Container(
        //   height: size.height/10,
        //   color: const Color(0xff252525),
        //   child: Row(
        //     children: [
        //       const Spacer(flex:1),
        //
        //       const Expanded(
        //         flex:2,
        //         child: CircleAvatar(
        //           radius: 50,
        //         ),
        //       ),
        //       Spacer(flex:1),
        //       Expanded(
        //         flex: 12,
        //         child: TextField(
        //           style: GoogleFonts.openSans(color: ourWhite,fontSize: 14),
        //           onTap: () {
        //             // Scrollable.ensureVisible(dataKey.currentContext!);
        //           },
        //           decoration: InputDecoration(
        //             suffixIcon: IconButton(
        //               icon:const Icon(Icons.send,color: Color(0xff8b8b8b),),
        //               onPressed: () {},
        //             ),
        //             hintStyle: GoogleFonts.openSans(fontSize: 12,color: Color(0xff8b8b8b)),
        //             hintText: "Add comment...",
        //             border: OutlineInputBorder(
        //                 borderRadius: BorderRadius.circular(15),
        //                 borderSide: BorderSide(
        //                     color: Color(0xff161616),
        //                     width: 2
        //                 )
        //             ),
        //             focusedBorder: OutlineInputBorder(
        //                 borderRadius: BorderRadius.circular(15),
        //                 borderSide: BorderSide(
        //                     color: Color(0xff161616),
        //                     width: 2
        //                 )
        //             ),
        //             disabledBorder: OutlineInputBorder(
        //                 borderRadius: BorderRadius.circular(15),
        //                 borderSide: BorderSide(
        //                     color: Color(0xff161616),
        //                     width: 2
        //                 )
        //             ),
        //
        //           ),
        //         ),
        //       ),
        //       Expanded(
        //         flex: 2,
        //         child: IconButton(
        //           icon: Icon(Icons.attach_file_sharp, color: ourWhite,),
        //           onPressed: () {},
        //         ),
        //       )
        //     ],
        //   ),
        // ),

      body: Scaffold(
         bottomNavigationBar: BottomCommentBar(),
        backgroundColor:const Color(0xff222222),
      //  resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: CustomScrollView(
            controller: _controller,

            slivers: [
              SliverPersistentHeader(
                // listen : true,
                floating: false,
                pinned: true,
                delegate: SliverAppBarDelegate(
                  listen: true,
                  minHeight: 62,
                  maxHeight: 62,
                  child: Consumer<ResponsiveHelp>(
                    builder: (context,_,__) {

                      switch(_respHelp.appBarStateDesp) {
                        case (AppBarStateDesp.Name):
                          return Container(
                            padding: EdgeInsets.only(left: 11, right: 15),
                            decoration: BoxDecoration(
                                color:     Color(0xff252525),
                                border: Border.all(color: Colors.black,width: 1)

                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: IconButton(
                                    icon: Icon(
                                      Icons.cancel_outlined,
                                      color: ourWhite,
                                    ),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ),
                                Consumer<ResponsiveHelp>(
                                  builder: (context, _, __) {
                                    return Flexible(
                                      flex: 4,
                                      child: Text(
                                        _respHelp.showDesAppBar == true
                                            ? " ${_instance.currentUser.title}"
                                            : " ",
                                        style: GoogleFonts.roboto(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700,
                                          color: ourWhite,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    );
                                  },
                                ),
                                Flexible(
                                    child: IconButton(
                                      icon: Icon(
                                        Icons.more,
                                        color: ourWhite,
                                      ),
                                      onPressed: () {},
                                    ))
                              ],
                            ),
                          );
                        case (AppBarStateDesp.AddDesp):
                          return Container(
                            child: Row(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    //_respHelp.showAddCardFunc(false);]
                                    _titleFocus.unfocus();
                                    _despFocus.unfocus();
                                    _respHelp.appBarStateDesp = AppBarStateDesp.Name;
                                    _respHelp.notifyListeners();
                                  },
                                  icon: Icon(Icons.cancel_outlined,color: ourWhite,),
                                ),
                                const SizedBox(width: 20,),
                                Text(_instance.appBarTitle,style: GoogleFonts.openSans(fontSize: 15,color: ourWhite),),
                                const Spacer(flex:1),
                                IconButton(
                                  icon: Icon(Icons.add,color:ourWhite),
                                  onPressed: ()  {

                                  },
                                )
                              ],
                            ),
                          );
                        default:
                          return Container();
                      }
                    },
                  ),
                ),
              ),

              SliverPersistentHeader(
                floating: false,
                pinned: false,
                delegate: SliverAppBarDelegate(
                  listen: true,
                  minHeight: 50.0,
                  maxHeight: size.height / 3,
                  child: Container(
                    padding: const EdgeInsets.only(top: 15, bottom: 15, left: 10, right: 10),
                    //height: size.height/3,
                    width: size.width,
                    color: const Color(0xff252525),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Spacer(
                          flex: 1,
                        ),
                        Consumer<ResponsiveHelp>(
                          builder: (context, _, __) {
                            return Expanded(
                              flex: 8,
                              child: TextFormField(
                                focusNode: _titleFocus,
                                style: GoogleFonts.montserrat(fontSize: 20, color: ourWhite),
                                onTap: () {
                                  // here I have to change the name shown on the appBar
                                  _instance.appBarTitle = "Edit Title...";
                                  _respHelp.appBarStateDesp = AppBarStateDesp.AddDesp;
                                  _respHelp.notifyListeners();
                                },
                                maxLines: 8,
                                controller: _nameController,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  disabledBorder:  InputBorder.none,
                                  focusedBorder:  UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: addGreen,
                                          width: 3
                                      )
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                        const Spacer(
                          flex: 1,
                        ),
                        Text(
                          "Daily Life in list Words of Wisdom",
                          style:
                          GoogleFonts.roboto(color: ourWhite, fontSize: 14),
                        ),
                        const Spacer(
                          flex: 1,
                        ),
                      ],
                    ),
                  ),
                ),
              ),


              const SliverToBoxAdapter(
                child: SizedBox(height: 15,),
              ),
              // this is going to be the Quick Actions Widget
              SliverToBoxAdapter(
                child: Container(

                  decoration: BoxDecoration(
                      color:     Color(0xff252525),
                      border: Border.all(color: Color(0xff111111),width: 1)
                  ),
                  child: ExpansionTile(
                    title: Text(
                        "Quick Actions",
                        style:GoogleFonts.openSans(fontSize: 20,fontWeight: FontWeight.bold,color: ourWhite)
                    ),
                    backgroundColor:Color(0xff252525),
                    collapsedBackgroundColor:Color(0xff252525),
                    collapsedIconColor: ourWhite,
                    iconColor: ourWhite,
                    expandedAlignment: Alignment.bottomLeft,
                    children: [
                      Row(
                        mainAxisAlignment:MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            padding: EdgeInsets.only(top:12,bottom: 12,left: 5,right: 5),
                            width:size.width/2.1,
                            decoration: BoxDecoration(
                              color: Color(0xff111111),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Row(
                              children: [
                                Spacer(flex:1),
                                Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      color: Color(0xff5aad43)
                                  ),
                                  child: Icon(Icons.check_box_rounded, color: ourWhite,),
                                ),
                                Spacer(flex:1),
                                //SizedBox(width: 15,),
                                Text("Add Checklist",style: GoogleFonts.openSans(color: ourWhite,fontSize: 15),),
                                Spacer(flex:1),

                              ],
                            ),
                          ),
                          Spacer(flex: 1,),
                          Container(
                            padding: EdgeInsets.only(top:12,bottom: 12,left: 5,right: 5),
                            width:size.width/2.1,
                            decoration: BoxDecoration(
                              color: Color(0xff111111),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Row(
                              children: [
                                Spacer(flex:1),
                                Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      color: Color(0xff08b7cc)
                                  ),
                                  child: Icon(Icons.attach_file_sharp, color: ourWhite,),
                                ),
                                Spacer(flex:1),
                                //SizedBox(width: 15,),
                                Text("Add Attachment",style: GoogleFonts.openSans(color: ourWhite,fontSize: 15),),
                                Spacer(flex:1),

                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 20,),
                      Container(
                        padding: EdgeInsets.only(top:12,bottom: 12,left: 5,right: 5),
                        width:size.width/2.1,
                        decoration: BoxDecoration(
                          color: Color(0xff111111),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          children: [
                            Spacer(flex:1),
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: Color(0xffc378e1)
                              ),
                              child: Icon(Icons.person, color: ourWhite,),
                            ),
                            Spacer(flex:1),
                            //SizedBox(width: 15,),
                            Text("Members",style: GoogleFonts.openSans(color: ourWhite,fontSize: 15),),
                            Spacer(flex:1),

                          ],
                        ),
                      ),
                      SizedBox(height: 20,),

                    ],
                  ),
                ),
              ),


              const SliverToBoxAdapter(
                child: SizedBox(height: 15,),
              ),
              // this is the text field that will be used for adding the description of the card
              SliverToBoxAdapter(

                key: dataKey,
                child: Container(

                  padding: EdgeInsets.all(10),
                  //height: 150,
                  width: size.width,
                  decoration: BoxDecoration(
                      color:     Color(0xff252525),
                      border: Border.all(color: Color(0xff111111),width: 1)

                  ),
                  child: TextFormField(
                    focusNode: _despFocus,
                    scrollController: _controllerTextField,
                    onTap: () {
                      //Scrollable.ensureVisible(dataKey.currentContext!);
                      // this is going to bring the focus on the text field
                      _controller.animateTo(_controller.offset+150, duration: Duration(milliseconds: 400), curve: Curves.linear);
                      _instance.appBarTitle = "Edit Description...";
                      _respHelp.appBarStateDesp = AppBarStateDesp.AddDesp;
                      _respHelp.notifyListeners();
                    },
                    onChanged: (value) {
                      //_controller.animateTo(_controller.offset+20, duration: Duration(milliseconds: 300), curve: Curves.linear,);

                    },
                    style: GoogleFonts.openSans(color: ourWhite,fontSize: 16),
                    keyboardType: TextInputType.multiline,
                    minLines: 3,
                    maxLines: 15,
                    decoration: InputDecoration(
                        fillColor: ourWhite,
                        //filled: true,
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
                        //errorMaxLines: 2,
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(Icons.description,color: ourWhite,),
                        ),

                        contentPadding: EdgeInsets.only(top:10,left: 15),
                        hintText: "Add card description...",
                        hintStyle: GoogleFonts.openSans(fontSize: 12,color: ourWhite,)
                    ),
                  ),
                ),
              ),



              // Labels will show here
              SliverToBoxAdapter(
                child: Container(

                ),
              ),

              // SliverToBoxAdapter(
              //   child: Container(
              //     color: Colors.red,
              //     height: 600,
              //   ),
              // ),

              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(top: 10,bottom: 10,left:13,right: 13),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("ACTIVITY",style: GoogleFonts.openSans(fontSize: 18,color: ourWhite),),
                      IconButton(onPressed: () {}, icon: Icon(Icons.menu,color: ourWhite,)),
                    ],
                  ),
                ),
              ),

              SliverList(


                delegate: SliverChildBuilderDelegate((BuildContext context, int index) {

                  return CommentWidget(commentThing: _instance.currentUser.comments![index],);
                },
                  childCount: _instance.currentUser.comments!= null ?_instance.currentUser.comments?.length:0,

                )
              ),
            ],
          ),
        ),
      )
    );
  }
}
