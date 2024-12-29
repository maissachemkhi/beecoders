import 'dart:io';
import 'package:path/path.dart' as path;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:beecoders/models/course.dart';
import 'package:path_provider/path_provider.dart';

class CourseViewModel {
  // Internal state
  String? _selectedImagePath;
  bool _isLoading = false;
  final ImagePicker _imagePicker = ImagePicker();

  // List of courses
  List<Course> courses = [
    Course(title: 'Flutter Development', price: 50, image: 'images/devops.jpg'),
    Course(title: 'Dart Programming', price: 40, image: 'images/teamwork.jpg'),
  ];

  // State update callback
  final Function(void Function()) updateState;

  set selectedImagePath(String? path) {
    _selectedImagePath = path;
    updateState(() {});
  }

  // Getters
  String? get selectedImagePath => _selectedImagePath;
  bool get isLoading => _isLoading;

  // Constructor
  CourseViewModel({required this.updateState});

  // Future<void> pickImage() async {
  //   try {
  //     _setLoading(true);
  //
  //     final XFile? image = await _imagePicker.pickImage(source: ImageSource.gallery);
  //
  //     if (image != null) {
  //      print('image not null');
  //       _selectedImagePath = image.path;
  //       updateState(() {});
  //
  //       print('Image selected: $_selectedImagePath');
  //     }
  //   } catch (e) {
  //     print('Error picking image: $e');
  //   } finally {
  //     _setLoading(false);
  //   }
  // }


  Future<void> pickImage() async {
    try {
      _setLoading(true);

      final XFile? image = await _imagePicker.pickImage(source: ImageSource.gallery);

      if (image != null) {
        // Get the app's documents directory
        final Directory appDocDir = await getApplicationDocumentsDirectory();

        // Create the path for images directory
        final String imagesPath = path.join(appDocDir.path, 'images');
        final Directory imageDir = Directory(imagesPath);

        if (!await imageDir.exists()) {
          print('Creating directory at: $imagesPath');
          await imageDir.create(recursive: true);
        }

        // Generate a unique filename using timestamp
        final String fileName = 'course_${DateTime.now().millisecondsSinceEpoch}${path.extension(image.path)}';
        final String destinationPath = path.join(imagesPath, fileName);

        // Copy the file to the images directory
        await File(image.path).copy(destinationPath);

        // Update the selected image path to use the copied file
        _selectedImagePath = destinationPath;
        updateState(() {});

        print('Image saved to: $_selectedImagePath');
      }
    } catch (e) {
      print('Error picking and saving image: $e');
    } finally {
      _setLoading(false);
    }
  }



  void clearImage() {
    _selectedImagePath = null;
    updateState(() {});
  }

  void _setLoading(bool value) {
    _isLoading = value;
    updateState(() {});
  }

  // Course creation
  Course? createCourse(String title, String price, String? image) {
    if (title.isEmpty || price.isEmpty) {
      return null;
    }

    final course = Course(
      image: image,
      title: title,
      price: double.parse(price),
    );

    courses.add(course);
    updateState(() {});
    return course;
  }

  // Update course
  bool updateCourse(int index, String title, String price, String? image) {
    print(' on update $index , $title , $price ');
    if (index < 0 || index >= courses.length || title.isEmpty || price.isEmpty) {
      return false;
    }

    courses[index] = Course(
      title: title,
      price: double.parse(price),
      image: image,
    );
    updateState(() {});
    return true;
  }

  // Delete course
  bool deleteCourse(int index) {
    if (index < 0 || index >= courses.length) {
      return false;
    }

    courses.removeAt(index);
    updateState(() {});
    return true;
  }

  // Cleanup
  void dispose() {
    _selectedImagePath = null;
    _isLoading = false;
  }
}