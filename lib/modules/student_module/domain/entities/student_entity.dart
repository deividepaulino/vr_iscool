class StudentEntity {
  int? id;
  String name;
  StudentEntity({
    required this.name,
    this.id,
  });

  factory StudentEntity.empty() {
    return StudentEntity(
      name: '',
    );
  }
}
