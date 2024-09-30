import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:result_dart/result_dart.dart';
import 'package:vr_iscool/modules/course_module/domain/entities/course_entity.dart';
import 'package:vr_iscool/modules/course_module/domain/repositories/course_get_repository.dart';
import 'package:vr_iscool/modules/course_module/domain/usecases/course_get_usecase_impl.dart';

class MockCourseGetRepository extends Mock implements CourseGetRepository {}

void main() {
  test('Buscar os dados do curso no repository', () async {
    final repository = MockCourseGetRepository();
    final usecase = CourseGetUsecaseImpl(repository);
    final courseEntity = CourseEntity(
        descricao: 'Teste VRSoft',
        id: 1,
        ementa: 'Ementa do curso aqui',
        totalAlunos: 1);
    final entity = CourseEntity(
      descricao: 'Teste VRSoft',
      id: 1,
      ementa: 'Ementa do curso aqui',
      totalAlunos: 1,
    );

    when(() => repository(entity))
        .thenAnswer((_) async => Success(courseEntity));
    final result = await usecase.call(entity);
    expect(result.getOrNull(), equals(courseEntity));
  });
}
