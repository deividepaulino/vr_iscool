import 'package:flutter_test/flutter_test.dart';
import 'package:vr_iscool/modules/course_module/domain/errors/course_exception.dart';

void main() {
  group('Excessão do dio', () {
    test('Deve ser um erro de requisição', () {
      var errorMessage = 'Error message';
      var error = CourseException(errorMessage);

      expect(error.message, equals(errorMessage));
    });
  });
}
