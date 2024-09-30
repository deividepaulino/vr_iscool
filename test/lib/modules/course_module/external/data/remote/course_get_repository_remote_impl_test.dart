import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:dio/dio.dart';
import 'package:result_dart/result_dart.dart';
import 'package:vr_iscool/modules/course_module/domain/entities/course_entity.dart';
import 'package:vr_iscool/modules/course_module/external/data/remote/course_get_list_datasource_remote_impl.dart';
import 'package:vr_iscool/modules/course_module/infra/datasources/course_get_list_datasource.dart';

class MockDio extends Mock implements Dio {}

void main() {
  late CourseGetListDataSource dataSource;
  late Dio dio;

  setUp(() {
    dio = MockDio();
    dataSource = CourseGetListDataSourceRemoteImpl(dio);
  });

  group('Fazer requisição http', () {
    test('Testar para ver se busca os itens na api', () async {
      final response = Response(
        statusCode: 200,
        data: [
          {"codigo": 5, "descricao": "Curso de VRSoft"},
          {"codigo": 11, "descricao": "Quantidade teste"},
          {"codigo": 12, "descricao": "Curso de teste"},
          {"codigo": 13, "descricao": "Curso de teste 5"},
          {"codigo": 14, "descricao": "Curso de teste 14"},
        ],
        requestOptions: RequestOptions(),
      );

      when(() => dio.get(any())).thenAnswer((_) async => response);

      final result = await dataSource(List<CourseEntity>.empty());

      expect(result, isA<Success>());
      final successResult = result as Success;
      expect(successResult.isSuccess(), true);
    });
  });
}
