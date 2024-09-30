import 'package:dio/dio.dart';
import 'package:result_dart/result_dart.dart';
import 'package:vr_iscool/modules/student_module/domain/entities/student_entity.dart';
import 'package:vr_iscool/modules/student_module/domain/errors/student_Patch_error.dart';
import 'package:vr_iscool/modules/student_module/domain/errors/student_api_error.dart';
import 'package:vr_iscool/modules/student_module/domain/typedefs/student_entity_result.dart';
import 'package:vr_iscool/modules/student_module/infra/datasources/student_patch_datasource.dart';
import 'package:vr_iscool/modules/student_module/infra/dtos/student_dto.dart';

class StudentPatchDataSourceRemoteImpl implements StudentPatchDataSource {
  final Dio dio;

  StudentPatchDataSourceRemoteImpl(this.dio);

  @override
  StudentEntityResult call(StudentEntity entities) async {
    try {
      final response = await dio.patch('/curso-alunos/${entities.id}',
          data: entities.updateCourse());

      if (response.statusCode == 200) {
        return Result.success(
          StudentEntity.empty(),
        );
      }

      if (response.statusCode == 400) {
        return Result.failure(
          StudentPatchError(response.data['message']),
        );
      }

      return Result.failure(
        StudentPatchError(
            'Erro ao obter status de requisição, erro: ${response.data['message']}'),
      );
    } on DioException catch (e) {
      return Result.failure(
        StudentApiError('Falha na requisição ${e.message}'),
      );
    }
  }
}
