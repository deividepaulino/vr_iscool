import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:vr_iscool/core/widgets/bottom_navigator_bar/bottom_nav_bar_widget.dart';
import 'package:vr_iscool/core/widgets/course_card_widget/course_card_widget.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({super.key});

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const CustomBottomMenu(),
      appBar: AppBar(
        actions: [
          IconButton(
              icon: Icon(Icons.notifications,
                  color: Theme.of(context).primaryColor),
              onPressed: () {}),
        ],
        title: const Text('Olá Deivide!'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 32),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: LayoutBuilder(
                    builder: (context, constraints) => Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.surface,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      width: constraints.maxWidth,
                      height: 130,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 32.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Toda oportunidade é ',
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              Row(
                                children: [
                                  Text(
                                    'um novo',
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  ),
                                  Text(
                                    ' aprendizado!',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .copyWith(
                                          color: Theme.of(context).primaryColor,
                                        ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              //rotate widget
              Positioned(
                right: -10,
                child: Transform.rotate(
                  angle: 0.4,
                  child: Lottie.asset('assets/animations/cat.json', width: 110),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16),
            child: Text(
              'Cursos populares',
              style: Theme.of(context).textTheme.displayMedium,
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: List.generate(
                  5,
                  (index) => const CourseCardWidget(),
                ),
              ),
            ),
          ),
          Container(
            height: 100,
            color: Colors.red,
          ),
        ],
      ),
    );
  }
}
