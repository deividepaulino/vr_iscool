import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:vr_iscool/core/shared/presenter/widgets/modals/confirm_modal/confirm_modal_widget.dart';
import 'package:vr_iscool/modules/student_module/domain/entities/student_entity.dart';
import 'package:vr_iscool/modules/student_module/presenter/atoms/student_atoms.dart';
import 'package:vr_iscool/modules/student_module/presenter/widgets/student_switch_modal_widget.dart';

class StudentCardWidget extends StatefulWidget {
  final StudentEntity student;
  const StudentCardWidget({super.key, required this.student});

  @override
  State<StudentCardWidget> createState() => _StudentCardWidgetState();
}

class _StudentCardWidgetState extends State<StudentCardWidget> {
  final studentAtoms = Modular.get<StudentAtoms>();
  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: const DrawerMotion(),
        children: [
          SlidableAction(
            borderRadius: const BorderRadius.only(),
            onPressed: (BuildContext context) {
              showDialog(
                  context: context,
                  builder: (context) {
                    return StudentSwitchModalWidget(
                      student: widget.student,
                    );
                  });
            },
            backgroundColor: Colors.blue.shade900,
            foregroundColor: Theme.of(context).colorScheme.surface,
            icon: Icons.sync,
            label: 'Curso',
            flex: 5,
          ),
          SlidableAction(
            borderRadius: const BorderRadius.only(),
            onPressed: (BuildContext context) {
              showDialog(
                  context: context,
                  builder: (context) {
                    return ConfirmModalWidget(
                      title: 'Remover curso',
                      content: 'Tem certeza que deseja remover este curso?',
                      leftAction: () {
                        studentAtoms.deleteStudentAction
                            .setValue(widget.student);
                      },
                      rightAction: () {},
                    );
                  });
            },
            backgroundColor: Theme.of(context).colorScheme.error,
            foregroundColor: Theme.of(context).colorScheme.surface,
            icon: Icons.cancel,
            flex: 3,
          ),
        ],
      ),
      child: Card(
        child: Row(
          children: [
            //
            Padding(
              padding: const EdgeInsets.only(
                  left: 8.0, top: 8.0, bottom: 8.0, right: 16),
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
                height: 70,
                width: 70,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.student.name,
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                Text(
                  'Telefone: (15) 98834-1654',
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                Text(
                  'E-mail: deividepcsvlog@gmail.com: ',
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                Text('Curso: ${widget.student.course}',
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(
                          color: Theme.of(context).primaryColor,
                        )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
