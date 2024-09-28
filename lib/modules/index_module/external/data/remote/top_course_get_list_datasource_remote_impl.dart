import 'package:dio/dio.dart';
import 'package:result_dart/result_dart.dart';
import 'package:vr_iscool/modules/index_module/domain/entities/top_coruse_entity.dart';
import 'package:vr_iscool/modules/index_module/domain/errors/top_course_api_error.dart';
import 'package:vr_iscool/modules/index_module/domain/errors/top_course_get_error.dart';
import 'package:vr_iscool/modules/index_module/domain/typedefs/top_course_get_list_result.dart';
import 'package:vr_iscool/modules/index_module/infra/datasources/top_course_get_list_datasource.dart';
import 'package:vr_iscool/modules/index_module/infra/dtos/top_course_list_dto.dart';

class TopCourseGetListDataSourceRemoteImpl
    implements TopCourseGetListDataSource {
  final Dio dio;

  TopCourseGetListDataSourceRemoteImpl(this.dio);

  @override
  TopCourseGetListResult call(List<TopCourseEntity> entities) async {
    try {
      final response = await dio.get('/curso-alunos/top-cursos/');

      if (response.statusCode == 200) {
        final topCoursesData = response.data as List<dynamic>;
        final topCoursesList = topCoursesData
            .map((topCourse) => topCourse as Map<String, dynamic>)
            .toList();
        return Result.success(
          TopCourseListDto.fromList(topCoursesList),
        );
      }
      return Result.failure(
        TopCourseGetError(
            'Erro ao obter status de requisição, erro: ${response.data['title']}'),
      );
    } on DioException catch (e) {
      return Result.failure(
        TopCourseApiError('Erro de conexão: ${e.message}'),
      );
    }
  }
}
