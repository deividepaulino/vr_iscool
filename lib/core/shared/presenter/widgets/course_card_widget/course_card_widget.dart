import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:vr_iscool/modules/course_module/domain/entities/course_entity.dart';

class CourseCardWidget extends StatefulWidget {
  final CourseEntity topCourseEntity;
  final bool enableSlide;
  final void Function()? onTapDelete;

  const CourseCardWidget({
    super.key,
    required this.topCourseEntity,
    this.enableSlide = false,
    this.onTapDelete,
  });

  @override
  State<CourseCardWidget> createState() => _CourseCardWidgetState();
}

class _CourseCardWidgetState extends State<CourseCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: (widget.enableSlide)
          ? ActionPane(
              motion: const DrawerMotion(),
              children: [
                SlidableAction(
                  borderRadius: const BorderRadius.only(),
                  onPressed: (BuildContext context) {
                    widget.onTapDelete!();
                  },
                  backgroundColor: Theme.of(context).colorScheme.error,
                  foregroundColor: Theme.of(context).colorScheme.surface,
                  icon: Icons.cancel,
                ),
              ],
            )
          : null,
      child: Row(
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
          Visibility(
            visible: widget.topCourseEntity.totalAlunos >= 0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    widget.topCourseEntity.totalAlunos.toString(),
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  Text('Alunos',
                      style: Theme.of(context).textTheme.displaySmall),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
