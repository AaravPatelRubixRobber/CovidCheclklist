import 'package:covidsurveyapp/surveyType.dart';
import 'package:covidsurveyapp/teacherType.dart';
import 'package:flutter/material.dart';
import 'package:covidsurveyapp/AppColors.dart';
import 'package:covidsurveyapp/send_email.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TeacherType instance = TeacherType();///TeacherType(List<String>.generate(10000, (i) => "$i"), ['Peck Place', 'Turkey Hill', 'Race Brook']);

  void goToSurvey(){
    Navigator.pushNamed(context, '/teacher_select' , arguments: instance);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.color1,
      body: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);

          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(10.0),
                  child: Text(
                    'COVID-19 Symptoms Daily Self-Checklist',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: AppColors.color3, fontSize: 35.0),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(0.0),
                  child: Image(
                    image: AssetImage(
                      'assets/townLogo.png',


                    ),
                    width: ((MediaQuery.of(context).size.width)/1.2),//((MediaQuery.of(context).size.width)/2.5)
                    height: ((MediaQuery.of(context).size.width)/1.2),
                  ),
                ),

                Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: 0.0, vertical: 5.0),
                  padding: EdgeInsets.symmetric(
                      horizontal: 0.0, vertical: 0.0),
                  decoration: BoxDecoration(
                    color: AppColors.color2,
                    border: Border.all(),
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  ),
                  child: FlatButton(
                    onPressed: () {
                      //sendEmail('peck', 'aarav.dhp@gmail.com', 'aarav');
                      goToSurvey();
                    }, //revisit this later
                    color: AppColors.color2,
                    child: Text(
                      'go to checklist',
                      style: TextStyle(color: AppColors.color3, fontSize: 30.0,),
                    ),
                  ),
                ),

              ],
            )
        ),
      ),
    );
  }
}
