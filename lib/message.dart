import 'package:covidsurveyapp/AppColors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class Message extends StatefulWidget {
  @override
  _MessageState createState() => _MessageState();
}

class _MessageState extends State<Message> {

  bool sick;

  @override
  Widget build(BuildContext context) {
    sick = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      backgroundColor: AppColors.color1,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Image(
              image: AssetImage(
                sick ? 'assets/sick_simple_emoji.png':'assets/happy_simple_emoji.png',
              ),
              width: ((MediaQuery.of(context).size.width)/ 2),//((MediaQuery.of(context).size.width)/2.5)
              height: ((MediaQuery.of(context).size.width)/2),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(
                horizontal: 10.0, vertical: 5.0),
            padding: EdgeInsets.symmetric(
                horizontal: 10.0, vertical: 10.0),
            child: Column(
              children: [

                sick? RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    // Note: Styles for TextSpans must be explicitly defined.
                    // Child text spans will inherit styles from parent
                    style: TextStyle(
                      fontSize: 25.0,
                      color: AppColors.color3,
                    ),
                    children: <TextSpan>[
                      TextSpan(text: 'As per the CDC guidlines, '),
                      TextSpan(text: 'your child is not allowed to go to school. Please contact your child\'s pediatrician and principal about this. ', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red)),
                      TextSpan(text: 'Thank you for your help stopping the spread. ',),

                      //TextSpan(text: 'very likely that your child is experiencing symptoms consistent with COVID-19. ', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red)),
                      //TextSpan(text: 'Please contact your pediatrician for further evaluation.'),

                    ],
                  ),
                ):RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    // Note: Styles for TextSpans must be explicitly defined.
                    // Child text spans will inherit styles from parent
                    style: TextStyle(
                      fontSize: 25.0,
                      color: AppColors.color3,
                    ),
                    children: <TextSpan>[
                      TextSpan(text: 'Your child is not displaying any symptoms of the coronavirus. '),
                      TextSpan(text: 'Your child is allowed to go to school. ', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green)),
                      TextSpan(text: 'Thank you for your help stopping the spread.'),
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                Text(
                  "Response(Positive or Negative) adapted from CDC guidelines",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: AppColors.color3,
                    fontSize: 8.0,
                  ),
                ),
                InkWell(
                    child: Text(
                        'https://www.cdc.gov/screening/index.html',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 8.0,
                      ),
                    ),
                    onTap: () => launch('https://www.cdc.gov/screening/index.html')
                ),
              ],
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
                Navigator.pushNamed(context, '/home');
              }, //revisit this later
              color: AppColors.color2,
              child: Text(
                'Got it',
                style: TextStyle(color: AppColors.color3, fontSize: 30.0,),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
