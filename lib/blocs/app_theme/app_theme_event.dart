part of 'app_theme_bloc.dart';

abstract class AppThemeEvent extends Equatable {
  const AppThemeEvent();

  @override
  List<Object> get props => [];
}

class ToggleAppThemeEvent extends AppThemeEvent {
  final AppThemeMode appThemeMode;
  const ToggleAppThemeEvent({required this.appThemeMode});

  @override
  List<Object> get props => [appThemeMode];
}
