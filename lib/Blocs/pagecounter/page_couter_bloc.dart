import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'page_couter_event.dart';
part 'page_couter_state.dart';

class PageCouterBloc extends Bloc<PageCouterEvent, PageCouterState> {
  PageCouterBloc() : super(PageCouterInitial(index: 0)) {
    on<IncreasePageEvent>((event, emit) {
      emit(PageCouterIncrementState(state.index + 1));
    });
    on<DecreasePageEvent>((event, emit) {
      if (state.index >= 0) {
        emit(PageCouterDecrementState(state.index - 1));
      }
    });
  }
}
