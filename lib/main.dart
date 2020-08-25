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

/*import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

main() async {
  String username = 'aaravdhp@gmail.com';
  String password = 'Milford@13585';

  final smtpServer = gmail(username, password);
  // Use the SmtpServer class to configure an SMTP server:
  // final smtpServer = SmtpServer('smtp.domain.com');
  // See the named arguments of SmtpServer for further configuration
  // options.

  // Create our message.
  final message = Message()
    ..from = Address(username, 'Your name')
    ..recipients.add('aarav.dhp@gmail.com')
  //..ccRecipients.addAll(['destCc1@example.com', 'destCc2@example.com'])
  //..bccRecipients.add(Address('bccAddress@example.com'))
    ..subject = 'Test Dart Mailer library :: 😀 :: ${DateTime.now()}'
    ..text = 'This is the plain text.\nThis is line 2 of the text part.'
    ..html = "<h1>Test</h1>\n<p>Hey! Here's some HTML content</p>";

  try {
    final sendReport = await send(message, smtpServer);
    print('Message sent: ' + sendReport.toString());
  } on MailerException catch (e) {
    print('Message not sent.');
    for (var p in e.problems) {
      print('Problem: ${p.code}: ${p.msg}');
    }
  }
  // DONE


  // Let's send another message using a slightly different syntax:
  //
  // Addresses without a name part can be set directly.
  // For instance `..recipients.add('destination@example.com')`
  // If you want to display a name part you have to create an
  // Address object: `new Address('destination@example.com', 'Display name part')`
  // Creating and adding an Address object without a name part
  // `new Address('destination@example.com')` is equivalent to
  // adding the mail address as `String`.

  /*final equivalentMessage = Message()
    ..from = Address(username, 'Your name')
    ..recipients.add(Address('destination@example.com'))
    ..ccRecipients.addAll([Address('destCc1@example.com'), 'destCc2@example.com'])
    ..bccRecipients.add('bccAddress@example.com')
    ..subject = 'Test Dart Mailer library :: 😀 :: ${DateTime.now()}'
    ..text = 'This is the plain text.\nThis is line 2 of the text part.'
    ..html = "<h1>Test</h1>\n<p>Hey! Here's some HTML content</p>";

  final sendReport2 = await send(equivalentMessage, smtpServer);*/

  // Sending multiple messages with the same connection
  //
  // Create a smtp client that will persist the connection
  var connection = PersistentConnection(smtpServer);

  // Send the first message
  await connection.send(message);

  // send the equivalent message
  //await connection.send(equivalentMessage);

  // close the connection
  await connection.close();

}*/

/*import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

main() {
  var options = new GmailSmtpOptions()
    ..username = 'kaisellgren@gmail.com'
    ..password = 'my gmail password'; // If you use Google app-specific passwords, use one of those.

  // As pointed by Justin in the comments, be careful what you store in the source code.
  // Be extra careful what you check into a public repository.
  // I'm merely giving the simplest example here.

  // Right now only SMTP transport method is supported.
  var transport = new SmtpTransport(options);

  // Create the envelope to send.
  var envelope = new Envelope()
    ..from = 'support@yourcompany.com'
    ..fromName = 'Your company'
    ..recipients = ['someone@somewhere.com', 'another@example.com']
    ..subject = 'Your subject'
    ..text = 'Here goes your body message';

  // Finally, send it!
  transport.send(envelope)
      .then((_) => print('email sent!'))
      .catchError((e) => print('Error: $e'));
}*/
