part of 'page_couter_bloc.dart';

@immutable
abstract class PageCouterEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class IncreasePageEvent extends PageCouterEvent {}

class DecreasePageEvent extends PageCouterEvent {}
