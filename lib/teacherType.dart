import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:covidsurveyapp/AppColors.dart';


class TeacherType{
  List<String> teachers = ['hi', 'bye', '1', '2', 'three', 'four', '12345678901234567890'];
  List<String> schools = ['Peck Place', 'Turkey Hill', 'Mary L. Tracy', 'Racebrook'];
  Map<String, String> teachersToEmails = {'12345678901234567890' : 'aarav.dhp@gmail.com', 'hi' : 'aarav.dhp@gmail.com', 'bye' : 'aarav.dhp@gmail.com', '1' : 'aarav.dhp@gmail.com', '2' : 'aarav.dhp@gmail.com', 'three': 'aarav.dhp@gmail.com', 'four': 'aarav.dhp@gmail.com'};
  List<String> peckTeachers = ['Haskos', 'Nolan', 'Rodenberg', 'Stevens', 'Behun', 'Gorry', 'Kiley', 'Hubley', 'Polis', 'Potts', 'Gionfriddo', 'Fahy', 'Swanson', 'Campbell', 'Kowaleski', 'Vogel', 'Laden', 'Palluzzi', 'Richard'];
  Map<String, List<String>> schoolsToTeachers = {'Peck Place' : ['Behun', 'Campbell', 'Fahy', 'Gionfriddo', 'Gorry', 'Haskos', 'Hubley', 'Kiley', 'Kowaleski', 'Laden', 'Nolan', 'Palluzzi', 'Polis', 'Potts', 'Richard', 'Rodenberg', 'Stevens', 'Swanson', 'Vogel'],
    'Turkey Hill' : ['Acker', 'Cimmino', 'DeMarco', 'Fortin(Mrs.)', 'Fortin(Mr.)', 'Gilbey', 'Ginsberg', 'Kranz', 'Malafronte', 'Marano', 'Mongillo', 'Napolitano', 'Ryczer', 'Sapienza', 'Sklanka', 'Smolenski', 'Ziegler', 'Zottoli'],
    'Racebrook' : ['Alves', 'Anton', 'Bakonyi', 'Battles', 'Bober', 'Bronson', 'Butler', 'Cydylo', 'Denton', 'Faustini', 'Foster', 'Gottsegen', 'Greenspan', 'Madigan', 'Martino', 'Martorana', 'Ocampo', 'Paolella', 'Pepe', 'Trayes', 'Volmar'],
    'Mary L. Tracy': ['Bell', 'Biro', 'Brooks', 'Castelot', 'Cua', 'Gloria', 'Hine', 'Improta', 'Kaplan', 'Luberti', 'Papa', 'Peterson', 'Tickell']};
  //List<String> sortedTeachers;
  String currentTeacher;
  String studentName;
  String currentSchool = 'Racebrook';
  List<String> currentTeachers = ['Alves', 'Anton', 'Bakonyi', 'Battles', 'Bober', 'Bronson', 'Butler', 'Cydylo', 'Denton', 'Faustini', 'Foster', 'Gottsegen', 'Greenspan', 'Madigan', 'Martino', 'Martorana', 'Ocampo', 'Paolella', 'Pepe', 'Trayes', 'Volmar'];


  /*TeacherType(this.teachers, this.schools) {
    teachers.sort();
  }*/
  TeacherType() {
    teachers.sort();
    schools.sort();
  }

  void updateCurrentTeachers() {
    currentTeachers = schoolsToTeachers[currentSchool];
    print(currentTeachers);
  }

  bool completed(){
    String i;
    bool inTeachers = false;
    bool inSchools = false;
    print(this.currentTeacher);
    print(studentName);

    try {
      for (i in schools) {
        if (i == currentSchool) {
          inSchools = true;
          break;
        }
      }
      if (!inSchools) {
        print('invalid school');
        return false;
      }
    } catch(e) {
      return false;
    }

    try {
      /*for (i in currentTeachers) {
        if (i == currentTeacher) {
          inTeachers = true;
          break;
        }
      }
      if (!inTeachers) {
        print('invalid teacher');
        return false;
      }*/
      if (studentName.length <= 1) {
        return false;
      }

      return true;
    } catch(e) {
      return false;
    }
  }

  setStudentName(val){
    studentName = val;
  }

  setCurrentTeacher(val){
    currentTeacher  = val;
  }

  setCurrentSchool(val){
    currentSchool = val;
  }
}
