import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

void sendEmail(teacher_name, teacher, student) async {
  String username = 'aarav.dhp@gmail.com';
  String password = 'Milford@13585';//OrangeAdmin
  String teacher_name_new = teacher_name + "'s";

  final smtpServer = gmail(username, password);
  // Use the SmtpServer class to configure an SMTP server:
  // final smtpServer = SmtpServer('smtp.domain.com');
  // See the named arguments of SmtpServer for further configuration
  // options.


  // Create our message.
  final message = Message()
    ..from = Address(username, 'Covid Checklist App')
    ..recipients.add('covidchecklisttracker2020@gmail.com')
  //..ccRecipients.addAll(['destCc1@example.com', 'destCc2@example.com'])
  //..bccRecipients.add(Address('bccAddress@example.com'))
    ..subject = 'Covid 19 spread'
  //..text = 'Your student $student has a high likelyhood of being in contact with the coronavirus, because of this, $student will stay home.';
    ..html = "<b> $student </b>" + "in" + "<b> $teacher_name_new </b>" + "class has a high likelihood of being in contact with the coronavirus";

  print('hi');
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

}
