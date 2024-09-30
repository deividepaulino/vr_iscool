import 'package:flutter_test/flutter_test.dart';
import 'package:vr_iscool/modules/course_module/domain/errors/course_Delete_error.dart';

void main() {
  group('Erro no delete', () {
    test('Deve ser um erro no delete', () {
      var errorMessage = 'Error message';
      var error = CourseDeleteError(errorMessage);

      expect(error.message, equals(errorMessage));
    });
  });
}
