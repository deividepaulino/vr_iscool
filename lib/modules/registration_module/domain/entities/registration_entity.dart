class RegistrationEntity {
  int? id;
  String name;
  int? courseId;
  String? course;
  RegistrationEntity({
    required this.name,
    this.id,
    this.courseId,
    this.course,
  });

  factory RegistrationEntity.empty() {
    return RegistrationEntity(
      name: '',
      course: '',
    );
  }
}
