import 'dart:developer';

import 'package:bustracker/models/journey_model.dart';
import 'package:bustracker/models/student_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestorHelper {
  FirestorHelper._();
  static FirestorHelper firestorHelper = FirestorHelper._();
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  final String _studentCollection = 'students';
  final String _journeyCollection = 'journey';
  //Register
  Future<String?> addNewStudent(Student student) async {
    try {
      DocumentReference<Map<String, dynamic>> document =
          await firestore.collection(_studentCollection).add(student.toMap());
      return document.id;
    } on Exception catch (e) {
      log(e.toString());
    }
    return '';
  }

  Future<bool> deleteStudent(String id) async {
    try {
      log('id = $id');

      await firestore.collection(_studentCollection).doc(id).delete();
      return true;
    } catch (e) {
      log(e.toString());
      return false;
    }
  }

  Future<List<Student>> getAllStudents() async {
    QuerySnapshot<Map<String, dynamic>> dnapshot =
        await firestore.collection(_studentCollection).get();
    List<Student> students = dnapshot.docs.map(
      (e) {
        Student student = Student.fromMap(e.data());
        student.id = e.id;
        return student;
      },
    ).toList();
    return students;
  }

  Future<bool?> updateStudent(Student student) async {
    try {
      await firestore
          .collection(_studentCollection)
          .doc(student.id)
          .update(student.toMap());
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<String?> startNewJourney(Journey journey) async {
    try {
      DocumentReference<Map<String, dynamic>> document =
          await firestore.collection(_journeyCollection).add(journey.toMap());
      return document.id;
    } on Exception catch (e) {
      log(e.toString());
    }
    return '';
  }

  updateJourney(Journey journey) async {
    try {
      await firestore
          .collection(_journeyCollection)
          .doc(journey.id)
          .update(journey.toMap());
      return true;
    } catch (e) {
      return false;
    }
  }
}
