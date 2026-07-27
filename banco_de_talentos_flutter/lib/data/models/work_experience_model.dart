import '../../domain/entities/work_experience.dart';

class WorkExperienceModel extends WorkExperience {
  const WorkExperienceModel({
    required super.id,
    required super.profileId,
    required super.jobTitle,
    required super.company,
    super.startDate,
    super.endDate,
    super.isCurrent,
    super.description,
  });

  factory WorkExperienceModel.fromJson(Map<String, dynamic> json) {
    return WorkExperienceModel(
      id: json['id'] as String,
      profileId: json['profile_id'] as String,
      jobTitle: json['job_title'] as String,
      company: json['company'] as String,
      startDate: json['start_date'] != null
          ? DateTime.parse(json['start_date'] as String)
          : null,
      endDate: json['end_date'] != null
          ? DateTime.parse(json['end_date'] as String)
          : null,
      isCurrent: json['is_current'] as bool? ?? false,
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'job_title': jobTitle,
      'company': company,
      'start_date': startDate?.toIso8601String().split('T').first,
      'end_date': endDate?.toIso8601String().split('T').first,
      'is_current': isCurrent,
      'description': description,
      if (id.isNotEmpty && !id.startsWith('temp_')) 'id': id,
      'profile_id': profileId,
    };
  }
}
