import 'package:dio/dio.dart';
import 'package:result_dart/result_dart.dart';
import 'package:vr_iscool/modules/course_module/domain/entities/course_entity.dart';
import 'package:vr_iscool/modules/course_module/domain/errors/course_Put_error.dart';
import 'package:vr_iscool/modules/course_module/domain/errors/course_api_error.dart';
import 'package:vr_iscool/modules/course_module/domain/typedefs/course_entity_result.dart';
import 'package:vr_iscool/modules/course_module/infra/datasources/course_put_datasource.dart';
import 'package:vr_iscool/modules/course_module/infra/dtos/course_dto.dart';

class CoursePutDataSourceRemoteImpl implements CoursePutDataSource {
  final Dio dio;

  CoursePutDataSourceRemoteImpl(this.dio);

  @override
  CourseEntityResult call(CourseEntity entities) async {
    try {
      final response =
          await dio.put('/curso/${entities.id}', data: entities.toUpdate());

      if (response.statusCode == 200) {
        return Result.success(
          CourseEntity.empty(),
        );
      }

      if (response.statusCode == 400) {
        return Result.failure(
          CoursePutError(response.data['message']),
        );
      }

      return Result.failure(
        CoursePutError(
            'Erro ao obter status de requisição, erro: ${response.data['message']}'),
      );
    } on DioException catch (e) {
      return Result.failure(
        CourseApiError('Falha na requisição ${e.message}'),
      );
    }
  }
}
