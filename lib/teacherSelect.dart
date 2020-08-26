import 'package:covidsurveyapp/teacherType.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:covidsurveyapp/AppColors.dart';
import 'package:covidsurveyapp/home.dart';
import 'package:covidsurveyapp/surveyPage.dart';
import 'package:covidsurveyapp/surveyType.dart';
import 'package:dropdownfield/dropdownfield.dart';
import 'package:covidsurveyapp/constants.dart';


class TeacherSelect extends StatefulWidget {
  @override
  _TeacherSelectState createState() => _TeacherSelectState();
}

class _TeacherSelectState extends State<TeacherSelect> {

  TeacherType type;

  SurveyType instance = SurveyType(["Has your child recently come in close contact (less than 6 ft for more than 15 mins) with anyone (family, friend etc.) who has been diagnosed with COVID-19 or who is under self-isolation/quarantining?",
    "Has your child traveled to an area or state under the CT Travel Advisory?",
    "Fever over 100 degrees Fahrenheit",
    "Loss of smell or taste",
    "Uncontrolled new Cough",
    "Sore Throat",
    "Muscle/body Aches",
    "Difficulty Breath",
    "Chills, Headaches, or Fatigue",
    "Gastrointestinal Symptoms (diarrhea, nausea, vomiting)"
  ], [
    ["Yes", "No"],
    ["Yes", "No"],
    ["Yes", "No"],
    ["Yes", "No"],
    ["Yes", "No"],
    ["Yes", "No"],
    ["Yes", "No"],
    ["Yes", "No"],
    ["Yes", "No"],
    ["Yes", "No"],
  ]);

  List<String> currentTeachers = [];

  TextEditingController _controller;

  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget type_ans(String question){
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            child: Text(
              question,
              style: TextStyle(
                color: AppColors.color3,
                fontSize: 15.0,
              ),
            ),
          ),
          TextFormField(
            //decoration: textInputDecoration.copyWith(hintText: 'email'),
            validator: (val) => val.isEmpty ? 'Enter an email' : null,
            controller: _controller,
            onChanged: (String value) async {
              type.setStudentName(value);
              print(value);
              setState(() {

              });

            },
          ),
        ],
      ),
    );
  }

  Widget drop_ans_teacher(String question, List<String> current_teachers) {
    print('\n\n');
    //print(type.currentSelected[index]);
    String dropdownValue = current_teachers[0];

    type.updateCurrentTeachers();

    return Container(
      //padding: EdgeInsets.all(15.0),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              child: Text(
                question,
                style: TextStyle(
                  color: AppColors.color3,
                  fontSize: 15.0,
                ),
              ),
            ),
            SizedBox(height: 20,),
            DropDownField(
              onValueChanged: (dynamic value) {
                type.setCurrentTeacher(value);
                setState(() {

                });
              },
              value: type.currentTeacher,
              required: false,
              hintText: 'Teacher Last Name',
              hintStyle: TextStyle(color: AppColors.color3),
              //labelText: 'Country',
              items: type.currentTeachers,
            ),
          ]),
    );

  }

  Widget drop_ans_school(String question, List<String> current_teachers) {
    print('\n\n');
    //print(type.currentSelected[index]);
    String dropdownValue = current_teachers[0];

    return Container(
      //padding: EdgeInsets.all(15.0),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              child: Text(
                question,
                style: TextStyle(
                  color: AppColors.color3,
                  fontSize: 15.0,
                ),
              ),
            ),
            SizedBox(height: 20,),
            DropDownField(
              onValueChanged: (dynamic value) {
                type.setCurrentSchool(value);
                type.updateCurrentTeachers();
                setState(() {

                });
              },
              value: type.currentSchool,
              required: false,
              hintText: 'School',
              hintStyle: TextStyle(color: AppColors.color3),
              //labelText: 'Country',
              items: type.schools,
            ),
          ]),
    );

  }
  @override
  Widget build(BuildContext context) {
    type = ModalRoute.of(context).settings.arguments;
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
            children: <Widget>[

              Flexible(
                child: ListView.builder(
                  itemCount: 3 + 2,//type.surveyList().length,//
                  itemBuilder: (context, ind) {
                    //return type.surveyList()[index];
                    int index = ind - 1;
                    print('hi');
                    print(index);
                    if(index >= 0 && index <= 2) {
                      return Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: MediaQuery. of(context).size.width / 30, vertical: MediaQuery. of(context).size.width / 60),
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 10.0),
                        decoration: BoxDecoration(
                          color: AppColors.color2,
                          border: Border.all(),
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            for ( var i = 0; i <
                                1; i++ ) index == 0 ?type_ans('Child Full Name: ') :(index == 1 ? drop_ans_school('Select a School:', type.teachers) : drop_ans_teacher('Select a teacher', type.currentTeachers)),
                          ],
                        ),
                      );
                    }if(index == -1) {
                      return Container(
                        margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Please answer these following questions",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: AppColors.color3,
                                fontSize: 30.0,
                              ),
                            ),
                          ],
                        ),
                      );
                    }if(true){//type.completed()
                      return Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: 50.0, vertical: 5.0),
                        padding: EdgeInsets.symmetric(
                            horizontal: 5.0, vertical: 10.0),
                        decoration: BoxDecoration(
                          color: AppColors.color2,
                          border: Border.all(),
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        ),
                        child: FlatButton(
                          onPressed: () {
                            print('\n\n\n\n\n');
                            //print(type.completed());
                            print('teacher name is :');
                            print(type.currentTeacher);
                            print('student email');
                            print(type.studentName);
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return type.completed()? AlertDialog(
                                  //title: Text("My title"),
                                  content: RichText(
                                    text: TextSpan(
                                      // Note: Styles for TextSpans must be explicitly defined.
                                      // Child text spans will inherit styles from parent
                                      style: TextStyle(
                                        fontSize: 25.0,
                                        color: AppColors.color3,
                                      ),
                                      children: <TextSpan>[
                                        TextSpan(text: 'Are you sure you entered the correct information'),
                                      ],
                                    ),
                                  ),
                                  actions: [
                                    FlatButton(
                                      child: Text("Yes"),
                                      onPressed: () {
                                        instance.setTeacherStudent(type.currentTeacher, type.studentName, type.teachersToEmails, type.currentSchool);
                                        Navigator.pushNamed(context, '/survey_page', arguments: instance);
                                      },
                                    ),
                                    FlatButton(
                                      child: Text("No"),
                                      onPressed: () {
                                        Navigator.pop(context);
                                        //SendEmail();////////////////
                                      },
                                    ),
                                  ],
                                ):AlertDialog(
                                  //title: Text("My title"),
                                  content: RichText(
                                    text: TextSpan(
                                      // Note: Styles for TextSpans must be explicitly defined.
                                      // Child text spans will inherit styles from parent
                                      style: TextStyle(
                                        fontSize: 25.0,
                                        color: AppColors.color3,
                                      ),
                                      children: <TextSpan>[
                                        TextSpan(text: 'You have not entered valid information into all the fields'),
                                      ],
                                    ),
                                  ),
                                  actions: [
                                    FlatButton(
                                      child: Text("OK"),
                                      onPressed: () {

                                        Navigator.pop(context);
                                      },
                                    ),

                                  ],
                                );;
                              },
                            );

                          }, //revisit this later
                          color: AppColors.color2,
                          child: Text(
                            'Next',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: AppColors.color3,
                              fontSize: 40.0,
                            ),
                          ),
                        ),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),

    );
  }
}
