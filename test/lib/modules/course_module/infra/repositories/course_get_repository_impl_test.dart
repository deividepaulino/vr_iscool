import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:result_dart/result_dart.dart';
import 'package:vr_iscool/modules/course_module/domain/entities/course_entity.dart';
import 'package:vr_iscool/modules/course_module/infra/datasources/course_get_datasource.dart';
import 'package:vr_iscool/modules/course_module/infra/repositories/course_repository_impl.dart';

class MockCourseGetDataSourceImpl extends Mock implements CourseGetDataSource {}

void main() {
  test('should get chart entity result from the usecase', () async {
    final usecase = MockCourseGetDataSourceImpl();
    final repository = CourseGetRepositoryImpl(usecase);
    final chartsEntity = CourseEntity(
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

    when(() => usecase.call(entity))
        .thenAnswer((_) async => Success(chartsEntity));
    final result = await repository.call(entity);
    expect(result.getOrNull(), equals(chartsEntity));
  });
}
