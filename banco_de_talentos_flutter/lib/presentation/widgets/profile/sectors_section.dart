import 'package:flutter/material.dart';
import '../../../domain/entities/profile.dart';

class SectorsSection extends StatelessWidget {
  final Profile profile;
  final VoidCallback onEditPressed;

  const SectorsSection({
    super.key,
    required this.profile,
    required this.onEditPressed,
  });

  String _translateSector(String enName) {
    switch (enName) {
      case 'Tourism':
        return 'Turismo';
      case 'Hospitality':
        return 'Hotelaria';
      case 'Gastronomy':
        return 'Gastronomia';
      case 'Events':
        return 'Eventos';
      case 'General Services':
        return 'Serviços Gerais';
      case 'Customer Service':
        return 'Atendimento';
      case 'Construction':
        return 'Construção Civil';
      default:
        return enName;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Setores de Atuação',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            IconButton(
              icon: const Icon(Icons.edit_outlined, size: 20, color: Colors.white),
              onPressed: onEditPressed,
            ),
          ],
        ),
        const SizedBox(height: 8),
        if (profile.sectors.isEmpty)
          const Text(
            'Nenhum setor de atuação selecionado.',
            style: TextStyle(fontSize: 14, color: Colors.white70, fontStyle: FontStyle.italic),
          )
        else
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: profile.sectors.map((sector) {
              return Chip(
                label: Text(
                  _translateSector(sector.name),
                  style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                ),
                backgroundColor: Colors.white.withOpacity(0.15),
                side: BorderSide(color: Colors.white.withOpacity(0.2)),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                labelStyle: const TextStyle(color: Colors.white),
              );
            }).toList(),
          ),
      ],
    );
  }
}
