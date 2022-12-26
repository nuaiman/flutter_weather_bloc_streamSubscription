part of 'temp_settings_bloc.dart';

abstract class TempSettingsEvent extends Equatable {
  const TempSettingsEvent();

  @override
  List<Object> get props => [];
}

class ToggleTempUnitEvent extends TempSettingsEvent {
  // final TempUnit tempUnit;
  // const ToggleTempUnitEvent({required this.tempUnit});

  // @override
  // List<Object> get props => [tempUnit];
}
