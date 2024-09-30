import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:vr_iscool/core/shared/presenter/widgets/buttons/elevated_buttom/elevated_buttom_widget.dart';
import 'package:vr_iscool/core/shared/presenter/widgets/text_form_field/text_form_field.dart';
import 'package:vr_iscool/modules/student_module/domain/entities/student_entity.dart';
import 'package:vr_iscool/modules/student_module/presenter/atoms/student_atoms.dart';

class AddStudentFormWidget extends StatefulWidget {
  const AddStudentFormWidget({super.key});

  @override
  State<AddStudentFormWidget> createState() => _AddStudentFormWidgetState();
}

class _AddStudentFormWidgetState extends State<AddStudentFormWidget> {
  final studentAtoms = Modular.get<StudentAtoms>();

  final descriptionController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 16.0,
        right: 16.0,
        bottom: MediaQuery.of(context).viewInsets.bottom,
        top: 16.0,
      ),
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Text(
                    'Cadastro de curso',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const Spacer(),
                  IconButton(
                    icon: Icon(
                      Icons.cancel,
                      color: Theme.of(context).colorScheme.error,
                    ),
                    onPressed: () {
                      Modular.to.pop();
                    },
                  ),
                ],
              ),
              const SizedBox(height: 16),
              VRTextFormField(
                hintText: 'Nome do curso',
                title: 'Nome do curso',
                context: context,
                controller: descriptionController,
                validator: (v) => v!.isEmpty ? 'Campo obrigatório' : null,
              ),
              const SizedBox(height: 16),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: VRButtonElevated.success(
                  size: const Size(double.maxFinite, 45),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      studentAtoms.postCurseAction.setValue(
                        StudentEntity(
                          name: descriptionController.text,
                        ),
                      );
                      Modular.to.pop();
                      return;
                    }
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Preencha todos os campos'),
                      ),
                    );
                  },
                  title: 'Finalizar Cadastro',
                  context: context,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
