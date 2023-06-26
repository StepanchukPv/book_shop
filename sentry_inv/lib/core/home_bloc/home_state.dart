class HomeState {
  HomeState(this.strs);

  final List<String> strs;

  HomeState copyWith({
    List<String>? strs,
  }) {
    return HomeState(strs ?? this.strs);
  }
}
