import 'package:dio/dio.dart';
import 'package:result_dart/result_dart.dart';
import 'package:vr_iscool/modules/course_module/domain/entities/course_entity.dart';
import 'package:vr_iscool/modules/course_module/domain/errors/course_api_error.dart';
import 'package:vr_iscool/modules/course_module/domain/errors/course_Delete_error.dart';
import 'package:vr_iscool/modules/course_module/domain/typedefs/course_entity_result.dart';
import 'package:vr_iscool/modules/course_module/infra/datasources/course_delete_datasource.dart';

class CourseDeleteDataSourceRemoteImpl implements CourseDeleteDataSource {
  final Dio dio;

  CourseDeleteDataSourceRemoteImpl(this.dio);

  @override
  CourseEntityResult call(CourseEntity entities) async {
    try {
      final response = await dio.delete('/curso/${entities.id}');

      if (response.statusCode == 200) {
        return Result.success(
          CourseEntity.empty(),
        );
      }
      return Result.failure(
        CourseDeleteError(
            'Erro ao obter status de requisição, erro: ${response.data['title']}'),
      );
    } on DioException catch (e) {
      return Result.failure(
        CourseApiError('Falha na requisição ${e.message}'),
      );
    }
  }
}
