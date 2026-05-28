sealed class TabsState {}

class TabsInitial extends TabsState {}

class TabsLoading extends TabsState {}

class TabsSuccess extends TabsState {
  final List<Map<String, dynamic>> movies;
  TabsSuccess(this.movies);
}

class TabsError extends TabsState {
  final String message;
  TabsError(this.message);
}

class WatchListUpdated extends TabsState {
  final bool isBookmarked;

  WatchListUpdated(this.isBookmarked);
}