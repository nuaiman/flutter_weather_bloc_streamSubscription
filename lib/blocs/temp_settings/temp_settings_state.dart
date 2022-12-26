part of 'temp_settings_bloc.dart';

enum TempUnit { celsius, farenheit }

class TempSettingsState extends Equatable {
  final TempUnit tempUnit;
  const TempSettingsState({this.tempUnit = TempUnit.celsius});

  @override
  List<Object> get props => [tempUnit];

  @override
  bool get stringify => true;

  TempSettingsState copyWith({
    TempUnit? tempUnit,
  }) {
    return TempSettingsState(
      tempUnit: tempUnit ?? this.tempUnit,
    );
  }

  factory TempSettingsState.initial() {
    return const TempSettingsState();
  }
}
