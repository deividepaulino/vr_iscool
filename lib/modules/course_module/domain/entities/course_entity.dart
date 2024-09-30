class CourseEntity {
  String descricao;
  String ementa;
  int totalAlunos;
  CourseEntity({
    required this.descricao,
    required this.ementa,
    required this.totalAlunos,
  });

  factory CourseEntity.empty() {
    return CourseEntity(
      descricao: '',
      ementa: '',
      totalAlunos: -1,
    );
  }
}
