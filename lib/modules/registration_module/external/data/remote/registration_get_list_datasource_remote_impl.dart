import 'package:dio/dio.dart';
import 'package:result_dart/result_dart.dart';
import 'package:vr_iscool/modules/registration_module/domain/entities/registration_entity.dart';
import 'package:vr_iscool/modules/registration_module/domain/errors/registration_api_error.dart';
import 'package:vr_iscool/modules/registration_module/domain/typedefs/registration_get_list_result.dart';
import 'package:vr_iscool/modules/registration_module/infra/datasources/registration_get_list_datasource.dart';
import 'package:vr_iscool/modules/registration_module/infra/dtos/registration_list_dto.dart';

class RegistrationGetListDataSourceRemoteImpl
    implements RegistrationGetListDataSource {
  final Dio dio;

  RegistrationGetListDataSourceRemoteImpl(this.dio);

  @override
  RegistrationGetListResult call(List<RegistrationEntity> entities) async {
    try {
      final response = await dio.get('/alunos/');

      if (response.statusCode == 200) {
        final topRegistrationsData = response.data as List<dynamic>;
        final topRegistrationsList = topRegistrationsData
            .map((topRegistration) => topRegistration as Map<String, dynamic>)
            .toList();
        return Result.success(
          RegistrationListDto.fromList(topRegistrationsList),
        );
      }
      return Result.failure(
        RegistrationApiError(
            'Erro ao obter status de requisição, erro: ${response.data['title']}'),
      );
    } on DioException catch (e) {
      return Result.failure(
        RegistrationApiError('Erro de conexão: ${e.message}'),
      );
    }
  }
}
