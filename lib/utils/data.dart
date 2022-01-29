import 'package:flutter/cupertino.dart';
import 'package:trello_clone/models/commentsModel.dart';
import 'package:trello_clone/models/labelsModel.dart';
import 'package:trello_clone/models/list_tile_data_model.dart';
import 'package:trello_clone/models/wholeListModel.dart';

SingleListModel oneBoard =
    SingleListModel(titleOfBoard: 'ummmmmm', wholeList: sampleNodes);

List<ListTileSingleNodeModel> sampleNodes = [
  ListTileSingleNodeModel(
      title: "Get grocerries from the market",
      index: 0,
      comments: [
        CommentModel(
          comment:
              "this is the comment that I originally wanted to write so okey",
          dateTime: DateTime.now(),
        ),
        CommentModel(
          comment:
              "this is the comment that I originally wanted to write so okey",
          dateTime: DateTime.now(),
        ),
      ]),
  ListTileSingleNodeModel(
    title: "Get grocerries from the market",
    index: 1,
  ),
  ListTileSingleNodeModel(
    title: "Get grocerries from the market",
    index: 2,
  ),
  ListTileSingleNodeModel(
    title:
        "Get grocerries from the market this is also responsible for somethings in life that are ",
    index: 3,
  ),
  ListTileSingleNodeModel(
    title: "Get grocerries from the market",
    index: 2,
  ),
  ListTileSingleNodeModel(
    title:
        "Get grocerries from the market this is also responsible for somethings in life that are ",
    index: 3,
  ),
  ListTileSingleNodeModel(
    title:
        "Get grocerries from the market sometimes it is hard to face reality and even tho i might get mad at you dont be afraid to stand alone sometimes its the best it ",
    index: 2,
  ),
];

List<LabelsModel> colorsModel = [
  LabelsModel(
    id: 0,
    color: Color(0xff61bd50),
    selected: false,
  ),
  LabelsModel(
    id: 1,
    color: Color(0xfff1d600),
    selected: false,
  ),
  LabelsModel(
    id: 2,
    color: Color(0xffffab49),
    selected: false,
  ),
  LabelsModel(
    id: 3,
    color: Color(0xffeb5a47),
    selected: false,
  ),
  LabelsModel(
    id: 4,
    color: Color(0xffc377e1),
    selected: false,
  ),
  LabelsModel(
    id: 5,
    color: Color(0xff0079be),
    selected: false,
  ),
  LabelsModel(
    id: 6,
    color: Color(0xff00c1e0),
    selected: false,
  ),
  LabelsModel(
    id: 7,
    color: Color(0xff51e897),
    selected: false,
  ),
  LabelsModel(
    id: 8,
    color: Color(0xffff80cf),
    selected: false,
  ),
  LabelsModel(
    id: 9,
    color: Color(0xff355262),
    selected: false,
  ),
  LabelsModel(
    id: 10,
    color: Color(0xffb3bec4),
    selected: false,
  ),
];
