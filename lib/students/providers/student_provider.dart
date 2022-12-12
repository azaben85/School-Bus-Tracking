import 'dart:io';

import 'package:bustracker/app_router/app_router.dart';
import 'package:bustracker/models/student_model.dart';
import 'package:bustracker/data_repositories/firestore_helper.dart';
import 'package:bustracker/data_repositories/image_picker_helper.dart';
import 'package:bustracker/data_repositories/storage_helper.dart';
import 'package:bustracker/students/views/screens/manage_student_screen.dart';
import 'package:flutter/material.dart';

class StudentProvider extends ChangeNotifier {
  StudentProvider() {
    getAllStudents();
  }
  GlobalKey<FormState> studentKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  File? imageFile;
  String? imageURL;
  String? collectionId;

  List<Student>? allStudents;
  getAllStudents() async {
    allStudents = await FirestorHelper.firestorHelper.getAllStudents();
    notifyListeners();
  }

  loadForUpdate(Student student) {
    nameController.text = student.name;
    addressController.text = student.address;
    imageURL = student.imageUrl;
    collectionId = student.id;
    AppRouter.appRouter.push(ManageStudent());
  }

  clearFields() {
    nameController.text = '';
    addressController.text = '';
    imageFile = null;
    imageURL = null;
    collectionId = null;
    //notifyListeners();
  }

  pickImageForCategory() async {
    imageFile =
        await ImagePickerHelper.imagePickerHelper.pickImageFromGallery();
    if (imageFile != null) {
      imageURL = null;
    }
    notifyListeners();
  }

  addCategory() async {
    if (imageFile != null || collectionId != null) {
      if (studentKey.currentState!.validate()) {
        AppRouter.appRouter.showProgressBar();
        String url;
        if (imageFile != null) {
          url = await StorageHelper.storageHelper
              .uploadNewImage('cat_images', imageFile!);
        } else {
          url = imageURL!;
        }
        Student student = Student(
            id: collectionId,
            name: nameController.text,
            imageUrl: url,
            address: addressController.text);
        if (collectionId == null) {
          await FirestorHelper.firestorHelper.addNewStudent(student);
        } else {
          await FirestorHelper.firestorHelper.updateStudent(student);
        }
        clearFields();
        getAllStudents();

        AppRouter.appRouter.pop();
        AppRouter.appRouter.pop();
      }
    } else {
      AppRouter.appRouter
          .showCustomDialog('Image Required', 'Please select Image First');
    }
  }

  deleteStudent(String id) async {
    AppRouter.appRouter.showProgressBar();

    bool status = await FirestorHelper.firestorHelper.deleteStudent(id);

    getAllStudents();
    AppRouter.appRouter.pop();
  }
}
