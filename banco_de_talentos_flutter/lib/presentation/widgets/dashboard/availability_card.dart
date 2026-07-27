import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:ui';
import '../../cubits/profile/profile_cubit.dart';

class AvailabilityCard extends StatelessWidget {
  final bool isAvailable;

  const AvailabilityCard({
    super.key,
    required this.isAvailable,
  });

  @override
  Widget build(BuildContext context) {
    final statusColor =
        isAvailable ? const Color(0xFF6CF8BB) : Colors.white70;

    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.1),
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
              color: isAvailable ? const Color(0xFF6CF8BB).withOpacity(0.5) : Colors.white.withOpacity(0.2), 
              width: 1.5,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Disponibilidade',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 4),
                    AnimatedDefaultTextStyle(
                      duration: const Duration(milliseconds: 200),
                      style: TextStyle(
                        fontSize: 14,
                        color: statusColor,
                        fontWeight: FontWeight.w500,
                      ),
                      child: Text(
                        isAvailable
                            ? 'Estou buscando oportunidades'
                            : 'Não estou buscando no momento',
                      ),
                    ),
                  ],
                ),
              ),
              Switch(
                value: isAvailable,
                activeColor: const Color(0xFF6CF8BB),
                activeTrackColor: const Color(0xFF6CF8BB).withOpacity(0.3),
                inactiveThumbColor: Colors.white70,
                inactiveTrackColor: Colors.white.withOpacity(0.1),
                onChanged: (value) {
                  context.read<ProfileCubit>().toggleAvailability(value);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
