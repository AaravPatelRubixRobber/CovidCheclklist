import 'package:covidsurveyapp/teacherSelect.dart';
import 'package:flutter/material.dart';
import 'package:covidsurveyapp/AppColors.dart';
import 'package:covidsurveyapp/home.dart';
import 'package:covidsurveyapp/surveyPage.dart';
import 'package:covidsurveyapp/message.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    debugShowCheckedModeBanner: false,
    routes: {
      '/': (context) => Home(),
      '/home': (context) => Home(),
      '/survey_page': (context) => SurveyPage(),
      '/teacher_select': (context) => TeacherSelect(),
      '/message': (context) => Message(),
    },
  ));
}
