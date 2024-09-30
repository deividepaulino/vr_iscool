import 'package:dio/dio.dart';
import 'package:result_dart/result_dart.dart';
import 'package:vr_iscool/modules/student_module/domain/entities/student_entity.dart';
import 'package:vr_iscool/modules/student_module/domain/errors/student_api_error.dart';
import 'package:vr_iscool/modules/student_module/domain/errors/student_delete_error.dart';
import 'package:vr_iscool/modules/student_module/domain/typedefs/student_entity_result.dart';
import 'package:vr_iscool/modules/student_module/infra/datasources/student_delete_datasource.dart';

class StudentDeleteDataSourceRemoteImpl implements StudentDeleteDataSource {
  final Dio dio;

  StudentDeleteDataSourceRemoteImpl(this.dio);

  @override
  StudentEntityResult call(StudentEntity entities) async {
    try {
      final response = await dio.delete('/alunos/${entities.id}');

      if (response.statusCode == 200) {
        return Result.success(
          StudentEntity.empty(),
        );
      }

      if (response.statusCode == 400) {
        return Result.failure(
          StudentDeleteError(response.data['message']),
        );
      }

      return Result.failure(
        StudentDeleteError(
            'Erro ao obter status de requisição, erro: ${response.data['message']}'),
      );
    } on DioException catch (e) {
      return Result.failure(
        StudentApiError('Falha na requisição ${e.message}'),
      );
    }
  }
}
