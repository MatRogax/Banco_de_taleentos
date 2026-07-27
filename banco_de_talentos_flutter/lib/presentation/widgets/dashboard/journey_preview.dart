import 'package:flutter/material.dart';
import 'dart:ui';
import '../../../domain/entities/profile.dart';

class JourneyPreview extends StatelessWidget {
  final Profile profile;

  const JourneyPreview({
    super.key,
    required this.profile,
  });

  @override
  Widget build(BuildContext context) {
    final experiences = profile.workExperiences;

    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.1),
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: Colors.white.withOpacity(0.2), width: 1.5),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Sua Jornada',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 16),
              if (experiences.isEmpty)
                const Text(
                  'Nenhuma experiência profissional cadastrada. Vá para o Perfil e adicione para valorizar seu currículo!',
                  style: TextStyle(fontSize: 14, color: Colors.white70),
                )
          else
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: experiences.length > 2 ? 2 : experiences.length,
              itemBuilder: (context, index) {
                final exp = experiences[index];
                final isLast = index ==
                    (experiences.length > 2 ? 1 : experiences.length - 1);

                String dateStr = '';
                if (exp.startDate != null) {
                  final startYear = exp.startDate!.year;
                  final endYear =
                      exp.isCurrent ? 'Presente' : (exp.endDate?.year ?? '');
                  dateStr = '$startYear - $endYear';
                }

                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Container(
                          width: 10,
                          height: 10,
                          margin: const EdgeInsets.only(top: 6),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                        ),
                        if (!isLast)
                          Container(
                            width: 2,
                            height: 40,
                            color: Colors.white.withOpacity(0.3),
                          ),
                      ],
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            exp.jobTitle,
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            '${exp.company} • $dateStr',
                            style: const TextStyle(
                                fontSize: 12, color: Colors.white70),
                          ),
                          const SizedBox(height: 8),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
        ],
      ),
    ),
      ),
    );
  }
}
