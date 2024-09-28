import 'package:flutter/material.dart';

class TeachersWidget extends StatefulWidget {
  const TeachersWidget({super.key});

  @override
  State<TeachersWidget> createState() => _TeachersWidgetState();
}

class _TeachersWidgetState extends State<TeachersWidget> {
  List<String> pics = [
    'assets/profile/ph1.png',
    'assets/profile/ph2.png',
    'assets/profile/ph3.png',
    'assets/profile/ph4.png',
    'assets/profile/ph5.png',
  ];

  List<String> names = [
    'Deivide',
    'David',
    'Deivid',
    'Dvd',
    'Daivid',
  ];

  List<String> descriptions = [
    'Flutter & Mobile',
    'Back-end',
    'UI/UX Design',
    'Scrum/Agile',
    'Web',
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          5,
          (index) => _buildCard(
            picturePath: pics[index],
            name: names[index],
            description: descriptions[index],
          ),
        ),
      ),
    );
  }

  _buildCard({
    required String picturePath,
    required String name,
    required String description,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(picturePath),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            height: 75,
            width: 75,
          ),
        ),
        Column(
          children: [
            Text(
              name,
              style: Theme.of(context).textTheme.displaySmall!.copyWith(
                    color: Theme.of(context).primaryColor,
                  ),
            ),
            Text(
              description,
              style: Theme.of(context).textTheme.displaySmall,
            ),
          ],
        )
      ],
    );
  }
}
