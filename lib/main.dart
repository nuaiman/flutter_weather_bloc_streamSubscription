import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'blocs/bloc_barrel.dart';
import 'repositories/weather_repository.dart';
import 'services/weatherapi_services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import 'screens/home_screen.dart';

void main() async {
  await dotenv.load(fileName: '.env');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => WeatherRepository(
          weatherApiServices: WeatherApiServices(httpClient: http.Client())),
      child: MultiBlocProvider(
        providers: [
          BlocProvider<WeatherBloc>(
            create: (context) => WeatherBloc(
                weatherRepository: context.read<WeatherRepository>()),
          ),
          BlocProvider<TempSettingsBloc>(
            create: (context) => TempSettingsBloc(),
          ),
          BlocProvider<AppThemeBloc>(
            create: (context) =>
                AppThemeBloc(weatherBloc: context.read<WeatherBloc>()),
          ),
        ],
        child: BlocBuilder<AppThemeBloc, AppThemeState>(
          builder: (context, state) {
            return MaterialApp(
              title: 'Flutter Weather',
              debugShowCheckedModeBanner: false,
              theme: state.appThemeMode == AppThemeMode.light
                  ? ThemeData.light().copyWith(brightness: Brightness.dark)
                  : ThemeData.dark().copyWith(brightness: Brightness.dark),
              home: const HomeScreen(),
            );
          },
        ),
      ),
    );
  }
}
