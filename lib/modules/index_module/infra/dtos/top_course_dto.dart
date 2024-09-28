import 'package:vr_iscool/modules/index_module/domain/entities/top_coruse_entity.dart';

extension TopCourseDto on TopCourseEntity {
  static fromJson(Map<String, dynamic>? json) {
    if (json == null) return TopCourseEntity.empty();

    return TopCourseEntity(
      descricao: json['descricao'] ?? '',
      totalAlunos: json['total_alunos'] ?? -1,
    );
  }

  static fromDB(Map<String, dynamic>? json) {
    if (json == null) return TopCourseEntity.empty();

    return TopCourseEntity(
      descricao: json['descricao'] ?? '',
      totalAlunos: json['total_alunos'] ?? -1,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'descricao': descricao,
      'total_alunos': totalAlunos,
    };
  }
}
