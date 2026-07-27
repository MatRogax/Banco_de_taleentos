import 'package:flutter/material.dart';
import '../../../domain/entities/profile.dart';

class ProfileHeader extends StatelessWidget {
  final Profile profile;

  const ProfileHeader({
    super.key,
    required this.profile,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Center(
          child: Stack(
            children: [
              CircleAvatar(
                radius: 56,
                backgroundColor: Color(0xFF10B981),
                child: Icon(
                  Icons.person,
                  size: 64,
                  color: Colors.white,
                ),
              ),
              Positioned(
                bottom: 2,
                right: 2,
                child: CircleAvatar(
                  radius: 16,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: 14,
                    backgroundColor: Color(0xFF10B981),
                    child: Icon(Icons.check, size: 16, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Center(
          child: Text(
            profile.fullName,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 6),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.location_on, size: 18, color: Colors.white70),
            const SizedBox(width: 4),
            Text(
              '${profile.city}, Brasil',
              style: const TextStyle(fontSize: 14, color: Colors.white70),
            ),
          ],
        ),
      ],
    );
  }
}
