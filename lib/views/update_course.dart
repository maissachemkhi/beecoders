import 'dart:io'; // Importing for File handling
import 'package:flutter/material.dart';
import 'package:beecoders/models/course.dart';
import '../viewmodels/course_view_model.dart';
import 'package:beecoders/views/create_course.dart';

class UpdateCourseModal extends StatefulWidget {
  final Course course;
  final int index;
  final Function(Course) onUpdateCourse;

  const UpdateCourseModal({
    Key? key,
    required this.course,
    required this.index,
    required this.onUpdateCourse
  }) : super(key: key);

  @override
  State<UpdateCourseModal> createState() => _UpdateCourseModalState();
}

class _UpdateCourseModalState extends State<UpdateCourseModal> {
  late final CourseViewModel viewModel;
  late final TextEditingController titleController;
  late final TextEditingController priceController;

  @override
  void initState() {
    super.initState();
    viewModel = CourseViewModel(updateState: setState);
    titleController = TextEditingController(text: widget.course.title);
    priceController = TextEditingController(text: widget.course.price.toString());
    viewModel.selectedImagePath = widget.course.image;
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color(0xFFffb454),
      title: const Text(
        'Update Course',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                labelText: 'Title',
                filled: true,
                fillColor: Colors.white.withOpacity(0.60),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: priceController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Price',
                filled: true,
                fillColor: Colors.white.withOpacity(0.60),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
            ),
            const SizedBox(height: 10),
            if (viewModel.selectedImagePath != null)
              Stack(
                alignment: Alignment.topRight,
                children: [
                  Image.asset(
                    viewModel.selectedImagePath!,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      setState(() {
                        viewModel.selectedImagePath = null;
                      });
                    },
                  ),
                ],
              ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: viewModel.isLoading ? null : viewModel.pickImage,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFb02c64),
                foregroundColor: Colors.white,
              ),
              child: viewModel.isLoading
                  ? const SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(strokeWidth: 2),
              )
                  : const Text('Change Image'),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text(
            'Cancel',
            style: TextStyle(
              color: Color(0xFFb02c64),
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            print('on click $titleController $priceController ');
            final course = Course(
                title :titleController.text,
              price:  double.parse(priceController.text),
               image:  null
            );
            if (course != null) {

              print ('new $course');
              widget.onUpdateCourse(course);
              Navigator.of(context).pop();
            } else {
              _showSnackBar('Please fill all fields correctly');
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFb02c64),
            foregroundColor: Colors.white,
          ),
          child: const Text('Update'),
        ),
      ],
    );
  }

  @override
  void dispose() {
    titleController.dispose();
    priceController.dispose();
    viewModel.dispose();
    super.dispose();
  }
}
