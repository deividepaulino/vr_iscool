class TopCourseEntity {
  String descricao;
  int totalAlunos;
  TopCourseEntity({
    required this.descricao,
    required this.totalAlunos,
  });

  factory TopCourseEntity.empty() {
    return TopCourseEntity(
      descricao: '',
      totalAlunos: 0,
    );
  }
}
