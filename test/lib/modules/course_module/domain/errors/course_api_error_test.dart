import 'package:flutter_test/flutter_test.dart';
import 'package:vr_iscool/modules/course_module/domain/errors/course_api_error.dart';

void main() {
  group('Api error', () {
    test('Deve ser uma subclasse de falha', () {
      var errorMessage = 'Deu ruim';
      var error = CourseApiError(errorMessage);

      expect(error.message, equals(errorMessage));
    });
  });
}
