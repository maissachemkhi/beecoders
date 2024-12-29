import 'package:flutter/material.dart';
import 'package:beecoders/views/create_course.dart';
import '../models/course.dart';
import 'package:beecoders/views/update_course.dart';
import 'package:beecoders/viewmodels/course_view_model.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({super.key});

  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  late CourseViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = CourseViewModel(updateState: setState);
  }

  void showAddCourseModal(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AddCourseModal(
        onAddCourse: (Course course) {
          // Handle the new course
          _viewModel.createCourse(course.title, course.price.toString(), course.image);
        },
      ),
    );
  }

  void deleteCourse(int index) {
    _viewModel.deleteCourse(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Interface'),
        backgroundColor: Colors.white24,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 0.60,
        ),
        itemCount: _viewModel.courses.length,
        itemBuilder: (context, index) {
          final course = _viewModel.courses[index];
          return Card(
            elevation: 5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  course.image ?? 'images/no_image.jpg',
                  height: 120,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    course.title,
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text(
                    '${course.price} DT/ Month',
                    style: const TextStyle(fontSize: 14, color: Color(0xFFb02c64)),
                    textAlign: TextAlign.center, // Center text horizontally
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return UpdateCourseModal(
                                course: course,
                                index: index,
                                onUpdateCourse: (Course course) {
                                  // Handle the new course
                                  _viewModel.updateCourse(index,course.title, course.price.toString(), course.image);
                                },
                              );
                            },
                          );
                        },
                        icon: const Icon(Icons.edit),
                        color: Colors.blue,
                        iconSize: 20,
                      ),

                      // Delete button
                      IconButton(
                        onPressed: () {
                          deleteCourse(index);
                        },
                        icon: const Icon(Icons.delete),
                        color: Colors.red,
                        iconSize: 20,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showAddCourseModal(context);
        },
        backgroundColor: const Color(0xFFb02c64),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
