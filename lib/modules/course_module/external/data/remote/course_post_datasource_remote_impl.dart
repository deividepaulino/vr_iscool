import 'package:dio/dio.dart';
import 'package:result_dart/result_dart.dart';
import 'package:vr_iscool/modules/course_module/domain/entities/course_entity.dart';
import 'package:vr_iscool/modules/course_module/domain/errors/course_Post_error.dart';
import 'package:vr_iscool/modules/course_module/domain/errors/course_api_error.dart';
import 'package:vr_iscool/modules/course_module/domain/typedefs/course_entity_result.dart';
import 'package:vr_iscool/modules/course_module/infra/datasources/course_post_datasource.dart';
import 'package:vr_iscool/modules/course_module/infra/dtos/course_dto.dart';

class CoursePostDataSourceRemoteImpl implements CoursePostDataSource {
  final Dio dio;

  CoursePostDataSourceRemoteImpl(this.dio);

  @override
  CourseEntityResult call(CourseEntity entities) async {
    try {
      final response = await dio.post('/curso/', data: entities.toJson());

      if (response.statusCode == 201) {
        return Result.success(
          CourseEntity.empty(),
        );
      }

      if (response.statusCode == 400) {
        return Result.failure(
          CoursePostError(response.data['message']),
        );
      }

      return Result.failure(
        CoursePostError(
            'Erro ao obter status de requisição, erro: ${response.data['message']}'),
      );
    } on DioException catch (e) {
      return Result.failure(
        CourseApiError('Falha na requisição ${e.message}'),
      );
    }
  }
}
