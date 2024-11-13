enum Status {
  intial,
  loading,
  success,
  error;

  bool get isInitial => this == Status.intial;

  bool get isLoading => this == Status.loading;

  bool get isSuccess => this == Status.success;

  bool get isError => this == Status.error;
}
