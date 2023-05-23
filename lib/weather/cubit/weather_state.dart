abstract class WeatherState {}

class WeatherInitial extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherLoaded extends WeatherState {
  final dynamic data;

  WeatherLoaded({required this.data});
}

class WeatherError extends WeatherState {
  final String errorText;

  WeatherError({required this.errorText});
}
