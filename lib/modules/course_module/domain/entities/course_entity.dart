class CourseEntity {
  int? id;
  String descricao;
  String ementa;
  int totalAlunos;
  CourseEntity({
    required this.descricao,
    required this.ementa,
    required this.totalAlunos,
    this.id,
  });

  factory CourseEntity.empty() {
    return CourseEntity(
      descricao: '',
      ementa: '',
      totalAlunos: -1,
    );
  }
}
