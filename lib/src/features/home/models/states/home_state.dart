import 'package:equatable/equatable.dart';

enum HomeTab { home, networks, posts, notifications, jobs }

class HomeState extends Equatable {
  const HomeState({this.tab = HomeTab.home});
  final HomeTab tab;

  @override
  List<Object?> get props => [tab];
}
