import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../services/database/hive_database.dart';

class AccountProvider extends ChangeNotifier {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  bool isEdit = false;
  File? file;
  final ImagePicker _picker = ImagePicker();



  void gallery(BuildContext context) async {
    Navigator.of(context).pop();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      var selected = File(image.path);
      file = selected;
      HiveService.setData(StorageKey.photo, image.path.toString());
    }

    notifyListeners();
  }

  void camera(BuildContext context) async {
    Navigator.of(context).pop();
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      var selected = File(image.path);
      file = selected;
      HiveService.setData(StorageKey.photo, image.path.toString());

      notifyListeners();
    }
  }

  void getImage(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => SafeArea(
        child: Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text("Gallery"),
              onTap: () => gallery(context),
            ),
            ListTile(
              leading: const Icon(Icons.photo_camera),
              title: const Text("Camera"),
              onTap: () => camera(context),
            ),
          ],
        ),
      ),
    );
    notifyListeners();

  }

  Widget? readImage() {
    if (HiveService.readData(StorageKey.photo) != null) {
      String? result = HiveService.readData(StorageKey.photo);

      return Image.file(
        File(result!),
        fit: BoxFit.cover,
      );
    }

    return ColoredBox(color: Colors.grey.shade300);
  }

  void readAllData() {
    if (HiveService.readData(StorageKey.userInfo) != null) {
      Map? userInfo = HiveService.readData(StorageKey.userInfo);
      nameController = TextEditingController(text: userInfo?['name'] ?? '');
      emailController = TextEditingController(text: userInfo?['email'] ?? '');
      mobileController = TextEditingController(text: userInfo?['mobile'] ?? '');
    }
  }

  void saveAllUser() {
    Map<String, dynamic> sendInfo = {
      "name": nameController.text.trim(),
      "email": emailController.text.trim(),
      "mobile": mobileController.text.trim(),
    };
    HiveService.setData(StorageKey.userInfo, sendInfo);
    isEdit = !isEdit;
    notifyListeners();
  }

  void editMethod() {
    isEdit = !isEdit;
    notifyListeners();
  }
}
