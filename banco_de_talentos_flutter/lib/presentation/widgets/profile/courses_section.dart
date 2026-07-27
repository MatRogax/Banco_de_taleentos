import 'package:flutter/material.dart';
import 'dart:ui';
import '../../../domain/entities/course.dart';

class CoursesSection extends StatelessWidget {
  final List<Course> courses;
  final Function(Course) onEditPressed;
  final Function(String) onDeletePressed;
  final VoidCallback onAddPressed;
  final Function(String) onCertificatePressed;

  const CoursesSection({
    super.key,
    required this.courses,
    required this.onEditPressed,
    required this.onDeletePressed,
    required this.onAddPressed,
    required this.onCertificatePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Cursos e Certificações',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            TextButton.icon(
              icon: const Icon(Icons.add, size: 18, color: Colors.white),
              label: const Text('Adicionar', style: TextStyle(color: Colors.white)),
              onPressed: onAddPressed,
            ),
          ],
        ),
        const SizedBox(height: 12),
        if (courses.isEmpty)
          const Text(
            'Nenhum curso cadastrado.',
            style: TextStyle(fontSize: 14, color: Colors.white70, fontStyle: FontStyle.italic),
          )
        else
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: courses.length,
            itemBuilder: (context, index) {
              final course = courses[index];
              final isCompleted = course.status == 'completed';

              return ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.white.withOpacity(0.2)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                              decoration: BoxDecoration(
                                color: isCompleted
                                    ? const Color(0xFF6CF8BB).withOpacity(0.2)
                                    : Colors.orangeAccent.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                isCompleted ? 'Concluído' : 'Em andamento',
                                style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                  color: isCompleted
                                      ? const Color(0xFF6CF8BB)
                                      : Colors.orangeAccent,
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.edit_outlined, size: 16, color: Colors.white70),
                                  onPressed: () => onEditPressed(course),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.delete_outline, size: 16, color: Colors.redAccent),
                                  onPressed: () => onDeletePressed(course.id),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          course.name,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          course.institution,
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: Colors.white70,
                          ),
                        ),
                        if (course.certificateUrl != null && course.certificateUrl!.isNotEmpty) ...[
                          const SizedBox(height: 12),
                          OutlinedButton.icon(
                            icon: const Icon(Icons.picture_as_pdf, size: 16, color: Colors.white),
                            label: const Text('Visualizar Certificado', style: TextStyle(color: Colors.white)),
                            onPressed: () => onCertificatePressed(course.certificateUrl!),
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(color: Colors.white70),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
      ],
    );
  }
}
