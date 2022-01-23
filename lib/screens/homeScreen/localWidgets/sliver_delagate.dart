import 'package:flutter/cupertino.dart';
import 'dart:math' as math;

import 'package:provider/provider.dart';
import 'package:trello_clone/provider/responsivenessHelper.dart';
class SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  Widget? newChild;
  bool? listen = false;

  SliverAppBarDelegate({
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
    Size size  = MediaQuery.of(context).size;
    //if(shrinkOffset)/
    // print("===============");
    // print(shrinkOffset);
    // print("===============");

    //print(shrinkOffset.);
    //if()
    ResponsiveHelp _respHelp = Provider.of<ResponsiveHelp>(context,listen:false);

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


      //print(shrinkOffset);
      if(shrinkOffset >= 80) {
        //print("Inside here");
        _respHelp.showDesAppBarFunc(true);
      } else{
        _respHelp.showDesAppBarFunc(false);
      }
        return SizedBox.expand(child: child);


      //return SizedBox.expand(child: child);
    }

    // return new SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}