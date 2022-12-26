import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_cubit_weather_app/blocs/weather/weather_bloc.dart';
import 'package:flutter_bloc_cubit_weather_app/constants/constants.dart';

part 'app_theme_event.dart';
part 'app_theme_state.dart';

class AppThemeBloc extends Bloc<AppThemeEvent, AppThemeState> {
  late final StreamSubscription themeSubscription;
  final WeatherBloc weatherBloc;
  AppThemeBloc({required this.weatherBloc}) : super(AppThemeState.initial()) {
    themeSubscription = weatherBloc.stream.listen(
      (WeatherState weatherState) {
        if (weatherState.weather.temp > kWarmOrNot) {
          add(const ToggleAppThemeEvent(appThemeMode: AppThemeMode.light));
        } else {
          add(const ToggleAppThemeEvent(appThemeMode: AppThemeMode.dark));
        }
      },
    );
    on<ToggleAppThemeEvent>((event, emit) {
      emit(state.copyWith(appThemeMode: event.appThemeMode));
    });
  }
}
