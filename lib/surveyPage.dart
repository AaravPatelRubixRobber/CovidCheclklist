import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:covidsurveyapp/AppColors.dart';
import 'package:covidsurveyapp/home.dart';
import 'package:covidsurveyapp/surveyPage.dart';
import 'package:covidsurveyapp/surveyType.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:covidsurveyapp/send_email.dart';

class SurveyPage extends StatefulWidget {
  @override
  _SurveyPageState createState() => _SurveyPageState();
}

class _SurveyPageState extends State<SurveyPage> {
  SurveyType type;

  /*void sendEmail() async {
    final Email email = Email(
      body: 'hi',
      subject: 'food',
      recipients: ['aarav.dhp@gmail.com'],
    );

    String platformResponse;

    try {
      await FlutterEmailSender.send(email);
      platformResponse = 'success';
    } catch (error) {
      platformResponse = error.toString();
    }*/

    Widget ans(String text, int questNum, int index) {
      print('\n\n');
      //print(type.currentSelected[index]);
      return Row(
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          IconButton(
            icon: Icon(
              type.selected[questNum][index] == 0? Icons.radio_button_unchecked: Icons.radio_button_checked, color: AppColors.color3,),
            highlightColor: AppColors.color3,
            onPressed: () {
              if(type.selected[questNum][index] == 0){
                type.resetSelected(questNum);//take out if you want to select multiple
                print(questNum);
                print(index);
                type.setSelected(questNum, index, 1);
              } else {
                type.setSelected(questNum, index, 0);
              }
              setState(() {

              });
            },
          ),
          Text(
            text,
            style: TextStyle(
              color: AppColors.color3,
              fontSize: 18.0,
            ),
          ),
        ],
      );
    }
    @override
    Widget build(BuildContext context) {
      type = ModalRoute.of(context).settings.arguments;
      return Scaffold(
        backgroundColor: AppColors.color1,
        body: SafeArea(
          child: Column(
            children: <Widget>[
              type.completed() ? Container(
                color: Colors.white,
                child: Text(
                  "You have completed your daily checklist. Please press the submit button down below.",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 15.0,
                  ),
                ),
              ): Container(),
              Flexible(
                child: ListView.builder(
                  itemCount: type.questions.length + 2,//type.surveyList().length,//
                  itemBuilder: (context, ind) {
                    //return type.surveyList()[index];
                    int index = ind - 1;
                    print('hi');
                    if(index >= 0 && index < type.questions.length) {
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
                            Container(
                              child: Text(
                                (index + 1).toString() + '.) ' +
                                    type.questions[index],
                                style: TextStyle(
                                  color: AppColors.color3,
                                  fontSize: 18.0,
                                ),
                              ),
                            ),
                            for ( var i = 0; i <
                                type.answers[index].length; i++ ) ans(
                                type.answers[index][i], index, i),

                          ],
                        ),
                      );
                    }else if(index == -1) {
                      return Container(
                        margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'COVID-19 Symptoms Daily Self-Checklist',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: AppColors.color3,
                                fontSize: 30.0,
                              ),
                            ),
                            SizedBox(height: 20,),
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
                      );
                    } else if(type.completed()){
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
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  //title: Text("My title"),
                                  content: type.isSick()? RichText(
                                    text: TextSpan(
                                      // Note: Styles for TextSpans must be explicitly defined.
                                      // Child text spans will inherit styles from parent
                                      style: TextStyle(
                                        fontSize: 25.0,
                                        color: AppColors.color3,
                                      ),
                                      children: <TextSpan>[
                                        TextSpan(text: 'Are you sure your child is '),
                                        TextSpan(text: 'SICK', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red)),
                                      ],
                                    ),
                                  ):RichText(
                                    text: TextSpan(
                                      // Note: Styles for TextSpans must be explicitly defined.
                                      // Child text spans will inherit styles from parent
                                      style: TextStyle(
                                        fontSize: 25.0,
                                        color: AppColors.color3,
                                      ),
                                      children: <TextSpan>[
                                        TextSpan(text: 'Are you sure your child is '),
                                        TextSpan(text: 'HEALTHY', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green)),
                                      ],
                                    ),
                                  ),
                                  actions: [
                                    FlatButton(
                                      child: Text("Yes"),
                                      onPressed: () {
                                        //sendEmail(type.school ,type.teachersToEmails[type.teacher], type.student);
                                        print('email sent');
                                        print(type.school);
                                        if(type.schoolToDefaultContact[type.school].length != 0 && type.isSick()){
                                          for(String email in type.schoolToDefaultContact[type.school]){
                                            sendEmail(type.school, email, type.student);
                                            print('email sent');
                                          }
                                        }
                                        Navigator.pushNamed(context, '/message', arguments: type.isSick());
                                      },
                                    ),
                                    FlatButton(
                                      child: Text("No"),
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
                            'Submit',
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

      );
    }
  }




/*Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              //color: AppColors.color2,
              child: Text(
                  type.currentQuestion,
                  style: TextStyle(
                    color: AppColors.color3,
                    fontSize: 40.0,
                  ),
              ),
            ),
            for ( var i = 0;i < type.currentAnswers.length; i++ ) Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              child: ans(type.currentAnswers[i], i),
            ),
            Row(
              //mainAxisAlignment: MainAxisAlignment.center,
              //crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                type.currentQuestionNum != 0 ? FlatButton(
                  onPressed: (){
                    type.prevQuestion();
                    setState(() {

                    });
                  },
                  color: AppColors.color2,
                  child: Text("Prev"),
                ): Container(),
                type.currentQuestionNum != type.questions.length - 1?FlatButton(
                  onPressed: (){
                    type.nextQuestion();
                    setState(() {

                    });
                  },
                  color: AppColors.color2,
                  child: Text("Next"),
                ): FlatButton(
                  onPressed: (){
                    type.nextQuestion();
                    setState(() {

                    });
                  },
                  color: AppColors.color2,
                  child: Text("Submit"),
                ),


              ],
            ),
          ],
        ),*/