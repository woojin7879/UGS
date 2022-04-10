import 'package:flutter/material.dart';

class Lecture{
  String? imagePath;
  String? lectureName;
  String? kind;
  String? professor;
  int? credit;
  bool?  retake = false;

  Lecture(
    {required this.lectureName,
    required this.kind,
    required this.professor,
    required this.imagePath,
    this.credit,
    this.retake});
}