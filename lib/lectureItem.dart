import 'package:flutter/material.dart';

class Lecture{
  String? imagePath;
  String? lectureName;
  String? kind;
  String? professor;
  bool?  retake = false;

  Lecture(
    {required this.lectureName,
    required this.kind,
    required this.professor,
    required this.imagePath,
    this.retake});
}