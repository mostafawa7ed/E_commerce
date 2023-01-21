part of 'page_couter_bloc.dart';

@immutable
class PageCouterState extends Equatable {
  final int index;
  PageCouterState({required this.index});

  @override
  List<Object> get props => [index];
}

class PageCouterInitial extends PageCouterState {
  PageCouterInitial({required int index}) : super(index: index);
}

class PageCouterIncrementState extends PageCouterState {
  PageCouterIncrementState(int incremanetvalue) : super(index: incremanetvalue);
}

class PageCouterDecrementState extends PageCouterState {
  PageCouterDecrementState(int decremaentvalue) : super(index: decremaentvalue);
}
