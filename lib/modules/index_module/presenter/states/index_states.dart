sealed class IndexStates {}

class IndexLoadingState extends IndexStates {}

class IndexSuccessState extends IndexStates {}

class IndexErrorState extends IndexStates {
  final String message;

  IndexErrorState(this.message);
}
