import 'package:flutter_test/flutter_test.dart';
import 'package:vr_iscool/modules/course_module/domain/entities/course_entity.dart';

void main() {
  group('CourseEntity', () {
    test('Criar instância da entidade', () {
      // Arrange
      const descricao = 'VrSoft Test';
      const ementa = 'Testes são importantes rapaz';
      const totalAlunos = 10;

      // Act
      final courseEntity = CourseEntity(
        descricao: descricao,
        ementa: ementa,
        totalAlunos: totalAlunos,
      );

      // Assert
      expect(courseEntity.descricao, descricao);
      expect(courseEntity.ementa, ementa);
      expect(courseEntity.totalAlunos, totalAlunos);
      expect(courseEntity.id, isNull);
    });

    test('Criar uma entidade vazia', () {
      // Act
      final emptyCourseEntity = CourseEntity.empty();

      // Assert
      expect(emptyCourseEntity.descricao, '');
      expect(emptyCourseEntity.ementa, '');
      expect(emptyCourseEntity.totalAlunos, -1);
      expect(emptyCourseEntity.id, -1);
    });
  });
}
