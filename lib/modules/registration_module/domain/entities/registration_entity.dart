class RegistrationEntity {
  int? id;
  String name;
  String? course;
  RegistrationEntity({
    required this.name,
    this.id,
    this.course,
  });

  factory RegistrationEntity.empty() {
    return RegistrationEntity(
      name: '',
      course: '',
    );
  }
}
