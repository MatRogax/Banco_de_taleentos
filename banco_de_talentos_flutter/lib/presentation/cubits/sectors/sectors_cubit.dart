import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../core/usecases/usecase.dart';
import '../../../domain/usecases/get_sectors_usecase.dart';
import 'sectors_state.dart';

@injectable
class SectorsCubit extends Cubit<SectorsState> {
  final GetSectorsUseCase _getSectorsUseCase;

  SectorsCubit(this._getSectorsUseCase) : super(SectorsInitial());

  Future<void> loadSectors() async {
    emit(SectorsLoading());
    final result = await _getSectorsUseCase(NoParams());
    result.fold(
      (failure) => emit(SectorsError(failure.message)),
      (sectors) => emit(SectorsLoaded(sectors)),
    );
  }
}
