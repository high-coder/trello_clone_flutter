import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ListDataAddWidget extends StatefulWidget {
  const ListDataAddWidget({Key? key}) : super(key: key);

  @override
  _ListDataAddWidgetState createState() => _ListDataAddWidgetState();
}

class _ListDataAddWidgetState extends State<ListDataAddWidget> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width - 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color(0xff222222),
      ),
      child: Center(
        child: Column(
          children: [
            // Title of the list
            Align(
              alignment: Alignment.topLeft,
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
            ListView.builder(
              shrinkWrap: true,
              itemCount: 2,
              itemBuilder: (context,index) {
                return Container(
                  margin: EdgeInsets.all(7),
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Color(0xff2c2c2e),
                  ),
                  child: Text("this is the sample text ", style: GoogleFonts.openSans(color: Colors.white),),
                );
              },
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(Icons.add, color: Color(0xff6db05d),),
                  Text("Add a card",style: GoogleFonts.openSans(color: Color(0xff6db05d)),),
                  Icon(Icons.add_a_photo, color: Colors.white,),
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}
