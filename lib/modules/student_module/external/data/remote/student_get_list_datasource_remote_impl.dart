import 'package:dio/dio.dart';
import 'package:result_dart/result_dart.dart';
import 'package:vr_iscool/modules/student_module/domain/entities/student_entity.dart';
import 'package:vr_iscool/modules/student_module/domain/errors/student_api_error.dart';
import 'package:vr_iscool/modules/student_module/domain/errors/student_get_error.dart';
import 'package:vr_iscool/modules/student_module/domain/typedefs/student_get_list_result.dart';
import 'package:vr_iscool/modules/student_module/infra/datasources/student_get_list_datasource.dart';
import 'package:vr_iscool/modules/student_module/infra/dtos/student_list_dto.dart';

class StudentGetListDataSourceRemoteImpl implements StudentGetListDataSource {
  final Dio dio;

  StudentGetListDataSourceRemoteImpl(this.dio);

  @override
  StudentGetListResult call(List<StudentEntity> entities) async {
    try {
      final response = await dio.get('/alunos/');

      if (response.statusCode == 200) {
        final topStudentsData = response.data as List<dynamic>;
        final topStudentsList = topStudentsData
            .map((topStudent) => topStudent as Map<String, dynamic>)
            .toList();
        return Result.success(
          StudentListDto.fromList(topStudentsList),
        );
      }
      return Result.failure(
        StudentGetError(
            'Erro ao obter status de requisição, erro: ${response.data['title']}'),
      );
    } on DioException catch (e) {
      return Result.failure(
        StudentApiError('Erro de conexão: ${e.message}'),
      );
    }
  }
}
