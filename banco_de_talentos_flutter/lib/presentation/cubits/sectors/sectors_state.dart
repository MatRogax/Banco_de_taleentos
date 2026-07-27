import 'package:equatable/equatable.dart';
import '../../../domain/entities/sector.dart';

abstract class SectorsState extends Equatable {
  const SectorsState();

  @override
  List<Object?> get props => [];
}

class SectorsInitial extends SectorsState {}

class SectorsLoading extends SectorsState {}

class SectorsLoaded extends SectorsState {
  final List<Sector> sectors;

  const SectorsLoaded(this.sectors);

  @override
  List<Object?> get props => [sectors];
}

class SectorsError extends SectorsState {
  final String message;

  const SectorsError(this.message);

  @override
  List<Object?> get props => [message];
}
