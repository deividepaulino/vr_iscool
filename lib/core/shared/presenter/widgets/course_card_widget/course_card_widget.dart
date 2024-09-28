import 'package:flutter/material.dart';
import 'package:vr_iscool/modules/index_module/domain/entities/top_coruse_entity.dart';

class CourseCardWidget extends StatefulWidget {
  final TopCourseEntity topCourseEntity;
  const CourseCardWidget({super.key, required this.topCourseEntity});

  @override
  State<CourseCardWidget> createState() => _CourseCardWidgetState();
}

class _CourseCardWidgetState extends State<CourseCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              image: const DecorationImage(
                image: AssetImage('assets/logotipo/semfoto.png'),
                fit: BoxFit.cover,
              ),
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
            height: 65,
            width: 100,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.topCourseEntity.descricao,
              style: Theme.of(context).textTheme.titleSmall,
            ),
            const Text('Descrição do curso'),
          ],
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                widget.topCourseEntity.totalAlunos.toString(),
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              Text('Alunos', style: Theme.of(context).textTheme.displaySmall),
            ],
          ),
        ),
      ],
    );
  }
}
