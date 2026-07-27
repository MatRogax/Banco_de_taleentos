import 'package:equatable/equatable.dart';

class WorkExperience extends Equatable {
  final String id;
  final String profileId;
  final String jobTitle;
  final String company;
  final DateTime? startDate;
  final DateTime? endDate;
  final bool isCurrent;
  final String? description;

  const WorkExperience({
    required this.id,
    required this.profileId,
    required this.jobTitle,
    required this.company,
    this.startDate,
    this.endDate,
    this.isCurrent = false,
    this.description,
  });

  @override
  List<Object?> get props => [
        id,
        profileId,
        jobTitle,
        company,
        startDate,
        endDate,
        isCurrent,
        description,
      ];
}
