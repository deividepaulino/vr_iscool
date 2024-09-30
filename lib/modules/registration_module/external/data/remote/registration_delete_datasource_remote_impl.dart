import 'package:dio/dio.dart';
import 'package:result_dart/result_dart.dart';
import 'package:vr_iscool/modules/registration_module/domain/entities/registration_entity.dart';
import 'package:vr_iscool/modules/registration_module/domain/errors/registration_api_error.dart';
import 'package:vr_iscool/modules/registration_module/domain/errors/registration_delete_error.dart';
import 'package:vr_iscool/modules/registration_module/domain/typedefs/registration_entity_result.dart';
import 'package:vr_iscool/modules/registration_module/infra/datasources/registration_delete_datasource.dart';

class RegistrationDeleteDataSourceRemoteImpl
    implements RegistrationDeleteDataSource {
  final Dio dio;

  RegistrationDeleteDataSourceRemoteImpl(this.dio);

  @override
  RegistrationEntityResult call(RegistrationEntity entities) async {
    try {
      final response = await dio.delete('/curso-alunos/${entities.id}');

      if (response.statusCode == 200) {
        return Result.success(
          RegistrationEntity.empty(),
        );
      }

      if (response.statusCode == 400) {
        return Result.failure(
          RegistrationDeleteError(response.data['message']),
        );
      }

      return Result.failure(
        RegistrationDeleteError(
            'Erro ao obter status de requisição, erro: ${response.data['message']}'),
      );
    } on DioException catch (e) {
      return Result.failure(
        RegistrationApiError('Falha na requisição ${e.message}'),
      );
    }
  }
}
