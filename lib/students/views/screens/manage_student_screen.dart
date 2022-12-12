import 'package:bustracker/components/custom_textformfield.dart';
import 'package:bustracker/global/validations.dart';
import 'package:bustracker/students/providers/student_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ManageStudent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<StudentProvider>(builder: (context, provider, child) {
      return Scaffold(
          appBar: AppBar(
              title: Text(
                  '${provider.collectionId == null ? 'Add' : 'Edit'} Student')),
          body: Form(
            key: provider.studentKey,
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    provider.pickImageForCategory();
                  },
                  child: SizedBox(
                    width: 150,
                    height: 150,
                    child: provider.imageURL != null
                        ? Image.network(provider.imageURL!)
                        : (provider.imageFile == null)
                            ? const Icon(
                                Icons.camera,
                                size: 60,
                              )
                            : Image.file(provider.imageFile!),
                  ),
                ),
                CustomTextField(
                    inputController: provider.nameController,
                    validation: validateText,
                    label: 'Student'),
                const SizedBox(
                  height: 30,
                ),
                CustomTextField(
                    inputController: provider.addressController,
                    validation: validateText,
                    label: 'Adderss'),
                const Spacer(),
                SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: ElevatedButton(
                      onPressed: () {
                        provider.addCategory();
                      },
                      child: Text(
                          '${provider.collectionId == null ? 'Add New' : 'Edit'} Student')),
                )
              ],
            ),
          ));
    });
  }
}
