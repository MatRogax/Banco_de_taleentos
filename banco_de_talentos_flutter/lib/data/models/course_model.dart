import '../../domain/entities/course.dart';

class CourseModel extends Course {
  const CourseModel({
    required super.id,
    required super.profileId,
    required super.name,
    required super.institution,
    required super.status,
    super.certificateUrl,
  });

  factory CourseModel.fromJson(Map<String, dynamic> json) {
    return CourseModel(
      id: json['id'] as String,
      profileId: json['profile_id'] as String,
      name: json['name'] as String,
      institution: json['institution'] as String,
      status: json['status'] as String? ?? 'completed',
      certificateUrl: json['certificate_url'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'institution': institution,
      'status': status,
      'certificate_url': certificateUrl,
      if (id.isNotEmpty && !id.startsWith('temp_')) 'id': id,
      'profile_id': profileId,
    };
  }
}
