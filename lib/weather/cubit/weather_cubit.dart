import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherInitial());

  var client = http.Client();
  dynamic newData;

  void loadWeather(String cityName) async {
    emit(WeatherLoading());

    String apiKey = "1f13d46c5b5bf30ca34c1d696485b389";
    String uri = "http://api.weatherstack.com/current?access_key=$apiKey&query=$cityName";

    try {
      var response = await client.get(Uri.parse(uri));

      if (kDebugMode) {
        print("::: response: ${response.statusCode}");
        print("::: response: ${response.body}");
      }

      var jsonData = jsonDecode(response.body);
      dynamic data;

      if (jsonData['success'] == false) {
        data = {
          'success': false,
          'data': jsonData,
        };
      } else {
        data = {
          'success': true,
          'data': jsonData,
        };
      }

      newData = data;

      emit(WeatherLoaded(data: data));
    } catch (e) {
      emit(WeatherError(errorText: e.toString()));
    }
  }
}
