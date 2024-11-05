abstract class CalendarState{}

class CalendarInitState extends CalendarState{}

class BoxUpdatedState extends CalendarState{}
class FetchingMemosLoadingState extends CalendarState{}
class MemosSuccessState extends CalendarState{}
class MemosErrorState extends CalendarState{
  final String errorMessage;
  MemosErrorState(this.errorMessage);
}

