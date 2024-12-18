part of 'main_bloc.dart';

class MainState extends Equatable {
  final Status status;
  final List<DoctorModel> doctors;
  final List<ArticleModel> articles;

  const MainState({
    this.status = Status.intial,
    this.doctors = const [],
    this.articles = const [],
  });

  @override
  List<Object?> get props => [status, doctors, articles];

  MainState copyWith({
    Status? status,
    List<DoctorModel>? doctors,
    List<ArticleModel>? articles,
  }) =>
      MainState(
        status: status ?? this.status,
        doctors: doctors ?? this.doctors,
        articles: articles ?? this.articles,
      );
}
