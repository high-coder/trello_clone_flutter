import 'package:trello_clone/models/commentsModel.dart';
import 'package:trello_clone/models/labelsModel.dart';

import 'checkListModel.dart';

/// V1 -- just create the basic functionality that is save the title of the card and then
/// save the index in which the user has dragged it or something

class ListTileSingleNodeModel {
  late String title;
  late int
      index; // this is the index in the list where it should be shown to the user
  double? heightOfNode;
  String? description;
  List<LabelsModel>? userSelectedLabels = [];
  DateTime? startDate;
  DateTime? dueDate;
  List<CommentModel>? comments = [];



  /// this will just contain the ids of the labels that are
  /// added and using this id we will compare user has selected which ones
  List<int> ?labels = [];
  List? members = []; // not in use right now

  List<CheckListModel>? checkListModels = [];

  ListTileSingleNodeModel(
      {required this.index,
      required this.title,
      this.heightOfNode,
      this.comments,
      this.description,
      this.checkListModels,
      this.dueDate,
      this.members,
      this.startDate,
      this.userSelectedLabels,this.labels});
}
