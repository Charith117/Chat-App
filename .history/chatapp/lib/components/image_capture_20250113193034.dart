// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

// class ImageCapture extends StatefulWidget {
//   @override
//   _ImageCaptureState createState() => _ImageCaptureState();
// }

// class _ImageCaptureState extends State<ImageCapture> {
//   final ImagePicker _picker = ImagePicker();
//   XFile? _imageFile;

//   Future<void> _captureImage() async {
//     final XFile? image = await _picker.pickImage(source: ImageSource.camera);
//     setState(() {
//       _imageFile = image;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Image Capture'),
//       ),
//       body: Center(
//         child: _imageFile == null
//             ? Text('No image selected.')
//             : Image.file(File(_imageFile!.path)),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _captureImage,
//         tooltip: 'Capture Image',
//         child: Icon(Icons.add_a_photo),
//       ),
//     );
//   }
// }








