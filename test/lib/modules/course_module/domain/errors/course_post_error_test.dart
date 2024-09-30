import 'package:flutter_test/flutter_test.dart';
import 'package:vr_iscool/modules/course_module/domain/errors/course_Post_error.dart';

void main() {
  group('Erro no post', () {
    test('Deve ser um erro no get', () {
      var errorMessage = 'Error message';
      var error = CoursePostError(errorMessage);

      expect(error.message, equals(errorMessage));
    });
  });
}
