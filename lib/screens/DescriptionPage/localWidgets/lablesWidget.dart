import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trello_clone/models/labelsModel.dart';
import 'package:trello_clone/provider/currentState.dart';
import 'package:trello_clone/utils/staticValues.dart';

class LablesWidget extends StatelessWidget {
  late LabelsModel labels;

  LablesWidget({required this.labels});

  @override
  Widget build(BuildContext context) {
    CurrentState _instance = Provider.of<CurrentState>(context,listen:false);


    context.select((CurrentState p) => p.shouldLabelsRebuild);
    return Container(
      margin: EdgeInsets.only(bottom: 8,right: 10),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: labels.id == 0 ? Icon(
              Icons.wine_bar,
              color: ourWhite,
            ) : Container(),
          ),
          Expanded(
            flex: 10,
            child: InkWell(
              onTap: () {
                labels.selected = !labels.selected;
                _instance.addOrRemoveLabels(labels.id, labels.selected);

              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                    color: labels.color,
                    borderRadius: BorderRadius.circular(5)
                ),
                child: labels.selected == true ?Center(
                  child: Icon(Icons.done,color: ourWhite,),
                ) : Container(),
              ),
            ),
          ),
          Expanded(
            flex:1,
            child: IconButton(
              icon: Icon(Icons.edit,color: ourWhite,),
              onPressed:() {},
            ),
          )
        ],
      ),
    );
  }
}
