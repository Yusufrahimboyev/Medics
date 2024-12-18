part of 'main_bloc.dart';

sealed class MainEvent {
  const MainEvent();
}

final class GetDoctors$MainEvent extends MainEvent {
  final BuildContext context;

  GetDoctors$MainEvent(this.context);
}

final class GetArticles$MainEvent extends MainEvent {
  final BuildContext context;

  GetArticles$MainEvent(this.context);
}
