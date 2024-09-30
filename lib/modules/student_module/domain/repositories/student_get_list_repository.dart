import 'package:vr_iscool/modules/student_module/domain/entities/student_entity.dart';
import 'package:vr_iscool/modules/student_module/domain/typedefs/student_get_list_result.dart';

abstract class StudentGetListRepository {
  StudentGetListResult call(
    List<StudentEntity> entities,
  );
}
