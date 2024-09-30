import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:vr_iscool/core/shared/presenter/widgets/buttons/elevated_buttom/elevated_buttom_widget.dart';
import 'package:vr_iscool/core/shared/presenter/widgets/text_form_field/text_form_field.dart';
import 'package:vr_iscool/modules/course_module/domain/entities/course_entity.dart';
import 'package:vr_iscool/modules/course_module/presenter/atoms/course_atoms.dart';

class AddCourseFormWidget extends StatefulWidget {
  final bool isEditing;
  final CourseEntity? entity;
  const AddCourseFormWidget({super.key, this.isEditing = false, this.entity});

  @override
  State<AddCourseFormWidget> createState() => _AddCourseFormWidgetState();
}

class _AddCourseFormWidgetState extends State<AddCourseFormWidget> {
  final courseAtoms = Modular.get<CourseAtoms>();

  final descriptionController = TextEditingController();
  final ementaController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    if (widget.isEditing) {
      descriptionController.text = widget.entity!.descricao;
      ementaController.text = widget.entity!.ementa;
    }
    super.initState();
  }

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
                    (widget.isEditing) ? 'Editando curso' : 'Cadastro de curso',
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
              VRTextFormField(
                hintText: 'Descrição do curso',
                title: 'Ementa do curso',
                context: context,
                controller: ementaController,
                validator: (v) => v!.isEmpty ? 'Campo obrigatório' : null,
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: VRButtonElevated.success(
                  size: const Size(double.maxFinite, 45),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      (widget.isEditing)
                          ? courseAtoms.putCurseAction.setValue(
                              widget.entity!
                                ..descricao = descriptionController.text
                                ..ementa = ementaController.text,
                            )
                          : courseAtoms.postCurseAction.setValue(
                              CourseEntity(
                                descricao: descriptionController.text,
                                ementa: ementaController.text,
                                totalAlunos: 0,
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
                  title: (widget.isEditing)
                      ? 'Finalizar edição'
                      : 'Finalizar Cadastro',
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
