import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:google_fonts/google_fonts.dart';
import 'package:measured_size/measured_size.dart';
import 'package:trello_clone/utils/data.dart';

class ListDataAddSlivers extends StatefulWidget {
  const ListDataAddSlivers({Key? key}) : super(key: key);

  @override
  _ListDataAddSliversState createState() => _ListDataAddSliversState();
}

class _ListDataAddSliversState extends State<ListDataAddSlivers> {

  int i  = 0;
  @override
  initState() {

      sampleNodes.forEach((element) {
        print("this is the value of the i $i");

        print("once");
        var span2 = TextSpan(
          text: element.title,
          style: GoogleFonts.openSans(
            fontSize: 14,
            color: Colors.white,
          ),

        );

        var tp = TextPainter(

          //maxLines: 1,
          text: span2,
          textAlign: TextAlign.left,
          textDirection: TextDirection.ltr,
        );
        tp.layout(maxWidth: 250);
        print("This is the height that is ${tp.height}");
        totalSize+=(tp.height+24);  // this plus 24 is estimate of the padding and the margin that is applied to the text to increase the height of the container
        i++;
      });

  }

  double totalSize = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    print(totalSize);
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
                  color: Color(0xff222222),
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
            child: Container(
              color: Color(0xff222222),
              height: totalSize >  size.height-200 ? size.height -200:totalSize,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: sampleNodes.length,
                itemBuilder: (context,index) {


                  return LayoutBuilder(builder: (context,constraints) {
                    //print(constraints.maxHeight);
                    return Container(
                      margin: EdgeInsets.all(7),
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Color(0xff2c2c2e),
                      ),
                      child: Text(sampleNodes[index].title, style: GoogleFonts.openSans(color: Colors.white),),
                    );
                  });
                },
              ),
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
                  decoration: const BoxDecoration(
                      color: Color(0xff222222),
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                      )
                  ),

                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Icon(Icons.add, color: Color(0xff6db05d),),
                      Text("Add a card",style: GoogleFonts.openSans(color: Color(0xff6db05d)),),
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