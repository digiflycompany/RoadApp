sealed class AddMemoState {}

final class AddMemoInitial extends AddMemoState {}

final class NoteAddedState extends AddMemoState {}

final class MemoPickupDateStates extends AddMemoState {}

final class MemoDropdownChangedState extends AddMemoState {}

final class AddingMemoLoadingState extends AddMemoState {}

final class AddMemoErrorState extends AddMemoState {
  final String error;

  AddMemoErrorState(this.error);
}