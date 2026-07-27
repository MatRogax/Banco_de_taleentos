import 'package:equatable/equatable.dart';

class Sector extends Equatable {
  final int id;
  final String name;

  const Sector({required this.id, required this.name});

  @override
  List<Object?> get props => [id, name];
}
