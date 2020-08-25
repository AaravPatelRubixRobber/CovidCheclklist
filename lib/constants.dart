
import 'package:covidsurveyapp/AppColors.dart';
import 'package:flutter/material.dart';
import 'package:covidsurveyapp/AppColors.dart';

const textInputDecoration = InputDecoration(
  fillColor: AppColors.color2,
  filled: true,
  contentPadding: EdgeInsets.all(12.0),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.white, width: 2.0),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.pink, width: 2.0),
  ),
);