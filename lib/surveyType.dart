
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:covidsurveyapp/AppColors.dart';


class SurveyType{
  List<String> questions;
  List<List<String>> answers;
  //String currentQuestion;
  //List<String> currentAnswers;
  //List<int> currentSelected;
  //int currentQuestionNum;
  //int currentAnswersNum;
  List<List<int>> selected;
  String teacher;
  String student;
  String school;
  Map<String, List<String>> schoolToDefaultContact = {'Turkey Hill': ['aarav.dhp@gmail.com'],//['darterbery@orange-ed.org', 'kmalone@orange-ed.org']
  'Mary L. Tracy': [], //['akinton@orange-ed.org', 'tlasto@orange-ed.org']
  'Peck Place': [],//['kmichelle@orange-ed.org', 'mgray@orange-ed.org']
  'Racebrook': []};//['Jbalisciano@orange-ed.org', 'CMingione@orange-ed.org']
  Map<String, String> teachersToEmails;


  SurveyType(this.questions, this.answers){
    //currentQuestionNum = 0;
    //currentAnswersNum = 0;
    //currentQuestion = questions[0];
    //currentAnswers = answers[0];
    selected = [];
    List<String> ca;
    for(ca in answers){
      List<int> miniSelected = [];
      for(int j = 0; j < ca.length; j++){
        miniSelected.add(0);
      }
      selected.add(miniSelected);
    }
    //currentSelected = selected[0];
  }
        /*:currentQuestionNum = 0,
        currentAnswersNum = 0,
        currentQuestion = questions[0],
        currentAnswers = answers[0],
        selected = [for ];*/



  /*void nextQuestion() {
    //currentQuestionNum++;
    //currentAnswersNum++;
    //currentQuestion = questions[currentQuestionNum];
    //currentAnswers = answers[currentAnswersNum];
    //currentSelected = selected[currentAnswersNum];

  }*/
  /*void prevQuestion() {
    //currentQuestionNum--;
    //currentAnswersNum--;
    //currentQuestion = questions[currentQuestionNum];
    //currentAnswers = answers[currentAnswersNum];
    //currentSelected = selected[currentAnswersNum];
  }*/

  void setSelected(i, j,  num) {
    /*selected[i][j] = num;
    currentSelected[index] = num;
    print(selected);
    print(currentSelected);*/
    selected[i][j] = num;
  }

  void setTeacherStudent(t, s, te, sch){
    teacher = t;
    student = s;
    teachersToEmails = te;
    school = sch;
  }

  void resetSelected(ans){
    for(int i = 0; i < answers[ans].length; i++){
      //currentSelected[i] = 0;
      selected[ans][i] = 0;
    }
  }

  List<dynamic> surveyList(){
    List<dynamic> myList = [];
    myList.add(Container(
      margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "If you reply",
            style: TextStyle(
              color: AppColors.color3,
              fontSize: 15.0,
            ),
          ),
          SizedBox(height: 10,),
          Text(
            "Yes",
            style: TextStyle(
              color: Colors.black,
              fontSize: 20.0,
              fontWeight: FontWeight.bold
            ),
          ),
          SizedBox(height: 10,),
          Text(
            "To any of the questions below",
            style: TextStyle(
              color: AppColors.color3,
              fontSize: 15.0,
            ),
          ),
          SizedBox(height: 10,),
          Center(
            child: Text(
              "PLEASE KEEP YOUR CHILD HOME",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.red,
                fontSize: 20.0,
              ),
            ),
          ),
        ],
      ),
    ));
    for(int index = 0; index < questions.length; index++){
      myList.add(Container(
        margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        decoration: BoxDecoration(
          color: AppColors.color2,
          border: Border.all(),
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Text(
                (index + 1).toString() + '.) ' + questions[index],
                style: TextStyle(
                  color: AppColors.color3,
                  fontSize: 15.0,
                ),
              ),
            ),
            for ( var i = 0;i < answers[index].length; i++ ) Row(
    //crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    selected[index][i] == 0? Icons.radio_button_unchecked: Icons.radio_button_checked, color: AppColors.color3,),
                    highlightColor: AppColors.color3,
                  onPressed: () {
                    if(selected[index][i] == 0){
                    resetSelected(index);//take out if you want to select multiple
                    setSelected(index, i, 1);
                    } else {
                    setSelected(index, i, 0);
                    }
                    /*setState(() {

                    });*/
                  },
                ),
                Text(
                answers[index][i],
                style: TextStyle(
                color: AppColors.color3,
                fontSize: 15.0,
                ),
                ),
                ],
                )//ans(answers[index][i], index, i),

            ],
        ),
      ));
    }
    print(this.completed());
    return myList;
  }

  dynamic ans(String text, int questNum, int index) {
    print('\n\n');
    //print(type.currentSelected[index]);
    return Row(
      //crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        IconButton(
          icon: Icon(
            selected[questNum][index] == 0? Icons.radio_button_unchecked: Icons.radio_button_checked, color: AppColors.color3,),
          highlightColor: AppColors.color3,
          onPressed: () {
            if(selected[questNum][index] == 0){
              this.resetSelected(questNum);//take out if you want to select multiple
              this.setSelected(questNum, index, 1);
            } else {
              this.setSelected(questNum, index, 0);
            }

          },
        ),
        Text(
          text,
          style: TextStyle(
            color: AppColors.color3,
            fontSize: 15.0,
          ),
        ),
      ],
    );
  }

  bool isSick(){
    print(selected);
    List<int> qSelected;
    for(qSelected in selected){
        if(qSelected[1] == 0 && qSelected[0] == 1){
          return true;
        }
    }
    return false;
  }
  bool completed(){

    bool ones;
    for(List<int> curSelected in selected){
      ones = false;
      for(int select in curSelected){
        if(select == 1){
          ones = true;
          break;
        }
      }
      if(!ones){
        return false;
      }
    }
    return true;
  }
}