class StudentEntity {
  int? id;
  String name;
  int? courseId;
  String? course;
  StudentEntity({
    required this.name,
    this.id,
    this.courseId,
    this.course,
  });

  factory StudentEntity.empty() {
    return StudentEntity(
      name: '',
      course: '',
    );
  }
}
