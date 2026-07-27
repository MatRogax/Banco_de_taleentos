import 'package:equatable/equatable.dart';
import 'sector.dart';
import 'work_experience.dart';
import 'course.dart';

class Profile extends Equatable {
  final String id;
  final String role;
  final String fullName;
  final String? documentId;
  final String? phone;
  final String city;
  final bool isAvailable;
  final String? bio;
  final String? resumeUrl;
  final List<Sector> sectors;
  final List<WorkExperience> workExperiences;
  final List<Course> courses;

  const Profile({
    required this.id,
    required this.role,
    required this.fullName,
    this.documentId,
    this.phone,
    required this.city,
    required this.isAvailable,
    this.bio,
    this.resumeUrl,
    this.sectors = const [],
    this.workExperiences = const [],
    this.courses = const [],
  });

  Profile copyWith({
    String? id,
    String? role,
    String? fullName,
    String? documentId,
    String? phone,
    String? city,
    bool? isAvailable,
    String? bio,
    String? resumeUrl,
    List<Sector>? sectors,
    List<WorkExperience>? workExperiences,
    List<Course>? courses,
  }) {
    return Profile(
      id: id ?? this.id,
      role: role ?? this.role,
      fullName: fullName ?? this.fullName,
      documentId: documentId ?? this.documentId,
      phone: phone ?? this.phone,
      city: city ?? this.city,
      isAvailable: isAvailable ?? this.isAvailable,
      bio: bio ?? this.bio,
      resumeUrl: resumeUrl ?? this.resumeUrl,
      sectors: sectors ?? this.sectors,
      workExperiences: workExperiences ?? this.workExperiences,
      courses: courses ?? this.courses,
    );
  }

  @override
  List<Object?> get props => [
        id,
        role,
        fullName,
        documentId,
        phone,
        city,
        isAvailable,
        bio,
        resumeUrl,
        sectors,
        workExperiences,
        courses,
      ];
}
