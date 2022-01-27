import 'package:flutter/material.dart';

class LabelsModel{
  late Color color;
  String ?name;
  bool selected;
  int id;
  LabelsModel({required this.color,required this.selected,this.name,required this.id});
}