

import 'package:flutter/material.dart';
import 'package:beecoders/models/course.dart';

import '../viewmodels/course_view_model.dart';

class AddCourseModal extends StatefulWidget {
  final Function(Course) onAddCourse;

  const AddCourseModal({
    Key? key,
    required this.onAddCourse,
  }) : super(key: key);

  @override
  State<AddCourseModal> createState() => _AddCourseModalState();
}

class _AddCourseModalState extends State<AddCourseModal> {
  late final CourseViewModel viewModel;
  final TextEditingController titleController = TextEditingController();
  final TextEditingController priceController = TextEditingController();

  @override
  void initState() {
    super.initState();
    viewModel = CourseViewModel(updateState: setState);
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
        'Add a Course',
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
                  borderRadius: BorderRadius.circular(25), // Rounded corners
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
                    height: 75,
                    fit: BoxFit.cover,
                  ),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: viewModel.clearImage,
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
                  : const Text('Upload Image'),
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
            print('i m testin ${titleController.text} // ${priceController.text}');
            final course = viewModel.createCourse(
              titleController.text,
              priceController.text,
                null
            );
print('couuuurse $course');
            if (course != null) {
              widget.onAddCourse(course);
              Navigator.of(context).pop();
            } else {
              _showSnackBar('Please fill all fields correctly');
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFb02c64),
            foregroundColor: Colors.white,
          ),
          child: const Text('Add'),
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