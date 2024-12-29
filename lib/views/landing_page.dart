import 'package:flutter/material.dart';
import 'admin_page.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
    child: AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    title: Padding(
    padding: const EdgeInsets.only(left: 8.0),
    child: Image.asset(
    'images/thebridge.png',
    height: 35,
    fit: BoxFit.contain,
    ),
    ),
    centerTitle: false,
    ),
    ),
    body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Section with background
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/teamwork.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 16),
            child: Center(
              child: Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.85),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Improve your skills on your own',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'To prepare for a better future',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFb02c64),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 35,
                          vertical: 10,
                        ),
                      ),
                      child: const Text(
                        'REGISTER NOW',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),

                    ),
                  ],
                ),
              ),
            ),
          ),


          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                // Courses Section
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Discover Our Courses',
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    ElevatedButton(
                      onPressed: () {

                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFb02c64),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                      ),
                      child: const Text(
                        'View More',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 16),
                GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: 2 / 2,
                  physics: const NeverScrollableScrollPhysics(),
                  children: const [
                    CourseCard(
                      title: 'Spring Boot / Angular',
                      price: '350 DT/Month',
                      imageUrl: 'images/springangular.jpg',
                    ),
                    CourseCard(
                      title: 'Node JS / React',
                      price: '350 DT/Month',
                      imageUrl: 'images/nodejsreact.jpg',
                    ),
                    CourseCard(
                      title: 'Flutter / Firebase',
                      price: '350 DT/Month',
                      imageUrl: 'images/flutterfirebase.png',
                    ),
                    CourseCard(
                      title: 'Business Intelligence',
                      price: '350 DT/Month',
                      imageUrl: 'images/businessintelligence.jpg',
                    ),
                    CourseCard(
                      title: 'Artificial Intelligence',
                      price: '350 DT/Month',
                      imageUrl: 'images/artificialintelligence.jpg',
                    ),
                    CourseCard(
                      title: 'DevOps',
                      price: '350 DT/Month',
                      imageUrl: 'images/devops.jpg',
                    ),
                  ],
                ),
                const SizedBox(height: 32),

                // Contact Section
                Container(
                  padding: const EdgeInsets.all(40),
                  decoration: BoxDecoration(
                    color: Color(0xFFffb454),
                    borderRadius: BorderRadius.circular(35),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          'Contact Us',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(height: 16),
                      const ContactForm(),
                    ],
                  ),
                ),
                const SizedBox(height: 60),
              ],
            ),
          ),
        ],
      ),
    ),
    );
  }
}

class CourseCard extends StatelessWidget {
  final String title;
  final String price;
  final String imageUrl;

  const CourseCard({
    required this.title,
    required this.price,
    required this.imageUrl,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                imageUrl,
                height: 75,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 8),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                price,
                style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xFFb02c64),
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ContactForm extends StatelessWidget {
  const ContactForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'NAME',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          textAlign: TextAlign.left,
        ),
        const SizedBox(height: 16),
        TextField(
          decoration: InputDecoration(
            labelText: 'Jiara Martins',
            filled: true,
            fillColor: Colors.white.withOpacity(0.60),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(25),
            ),
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'EMAIL',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          textAlign: TextAlign.left,
        ),
        const SizedBox(height: 16),
        TextField(
          decoration: InputDecoration(
            labelText: 'hello@reallygreatsite.com',
            filled: true,
            fillColor: Colors.white.withOpacity(0.60),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(25),
            ),
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'MESSAGE',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          textAlign: TextAlign.left,
        ),
        const SizedBox(height: 16),
        TextField(
          maxLines: 3,
          decoration: InputDecoration(
            labelText: 'Write your message here',
            filled: true,
            fillColor: Colors.white.withOpacity(0.60),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(25),
            ),
          ),
        ),
        const SizedBox(height: 16),
        Align(
          alignment: Alignment.center,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFFb02c64),

              padding: const EdgeInsets.symmetric(
                horizontal: 35,
                vertical: 10,
              ),
            ),
            child: const Text(
              'Send the message',
              style: TextStyle(
                color: Colors.white,
              ),
            ),

          ),
        ),
        const SizedBox(height: 15),

      ],
    );
  }
}
