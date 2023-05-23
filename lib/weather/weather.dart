import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_demos/weather/cubit/weather_cubit.dart';
import 'package:flutter_bloc_demos/weather/cubit/weather_state.dart';

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  TextEditingController txtCity = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) {
        return Scaffold(
          body: SingleChildScrollView(
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 40),
                  if (state is WeatherError)
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text(
                        state.errorText,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Theme.of(context).colorScheme.error,
                            ),
                      ),
                    ),
                  if (state is WeatherLoaded)
                    (state.data['success'] == true)
                        ? Column(
                            children: [
                              Text(
                                "${state.data['data']['current']['temperature']}",
                                style: Theme.of(context).textTheme.displayLarge,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "${state.data['data']['current']['weather_descriptions'][0]}",
                                    style: Theme.of(context).textTheme.headlineSmall,
                                  ),
                                  const SizedBox(width: 16),
                                  Image.network(state.data['data']['current']['weather_icons'][0]),
                                ],
                              ),
                              ListTile(
                                leading: const Icon(Icons.wind_power),
                                title: const Text("Wind speed"),
                                trailing: Text("${state.data['data']['current']['wind_speed']}"),
                              ),
                              ListTile(
                                leading: const Icon(Icons.location_on),
                                title: const Text("location"),
                                trailing: Text("${state.data['data']['location']['name']}"),
                              ),
                            ],
                          )
                        : const Text("Please enter a valid city name"),
                  (state is WeatherLoading)
                      ? const Center(child: CircularProgressIndicator())
                      : Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            children: [
                              TextFormField(
                                controller: txtCity,
                                decoration: const InputDecoration(
                                  hintText: "City name",
                                ),
                              ),
                              const SizedBox(height: 16),
                              ElevatedButton(
                                onPressed: () => context.read<WeatherCubit>().loadWeather(txtCity.text),
                                child: const Text("Load Weather"),
                              ),
                            ],
                          ),
                        ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
