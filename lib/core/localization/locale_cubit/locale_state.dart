part of 'locale_cubit.dart';

@immutable
abstract class LocaleState {}

class ChangeLocaleState extends LocaleState {
  final Locale locale;
  ChangeLocaleState({
    required this.locale,
  });
}
