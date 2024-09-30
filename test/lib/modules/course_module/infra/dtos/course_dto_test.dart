import 'package:flutter_test/flutter_test.dart';
import 'package:vr_iscool/modules/course_module/domain/entities/course_entity.dart';
import 'package:vr_iscool/modules/course_module/infra/dtos/course_dto.dart';

void main() {
  group('Validação do DTO', () {
    test('toJson deve retornar a estrutura do objeto em json', () {
      final courseEntity = CourseEntity(
        id: 5,
        descricao: 'Curso de VRSoft',
        ementa: 'Ementa do curso',
        totalAlunos: 25,
      );

      final json = courseEntity.toJson();

      expect(json['descricao'], 'Curso de VRSoft');
      expect(json['ementa'], 'Ementa do curso');
    });
  });
}
