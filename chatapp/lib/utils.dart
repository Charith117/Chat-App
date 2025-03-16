import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

pickImage(ImageSource source) async {
  // Implement image picker here
  final ImagePicker imagepicker = ImagePicker();
  final XFile? image = await imagepicker.pickImage(source: source);
  if (image != null) {
    // Implement image upload here
    return await image.readAsBytes();

  }
  print('No image selected');
}
