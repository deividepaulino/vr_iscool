import 'package:dio/dio.dart';
import 'package:result_dart/result_dart.dart';
import 'package:vr_iscool/modules/course_module/domain/entities/course_entity.dart';
import 'package:vr_iscool/modules/course_module/domain/errors/course_api_error.dart';
import 'package:vr_iscool/modules/course_module/domain/errors/course_get_error.dart';
import 'package:vr_iscool/modules/course_module/domain/typedefs/course_get_list_result.dart';
import 'package:vr_iscool/modules/course_module/infra/datasources/course_get_list_datasource.dart';
import 'package:vr_iscool/modules/course_module/infra/dtos/course_list_dto.dart';

class TopCourseGetListDataSourceRemoteImpl implements CourseGetListDataSource {
  final Dio dio;

  TopCourseGetListDataSourceRemoteImpl(this.dio);

  @override
  CourseGetListResult call(List<CourseEntity> entities) async {
    try {
      final response = await dio.get('/curso-alunos/top-cursos/');

      if (response.statusCode == 200) {
        final topCoursesData = response.data as List<dynamic>;
        final topCoursesList = topCoursesData
            .map((topCourse) => topCourse as Map<String, dynamic>)
            .toList();
        return Result.success(
          CourseListDto.fromList(topCoursesList),
        );
      }
      return Result.failure(
        CourseGetError(
            'Erro ao obter status de requisição, erro: ${response.data['title']}'),
      );
    } on DioException catch (e) {
      return Result.failure(
        CourseApiError('Erro de conexão: ${e.message}'),
      );
    }
  }
}
