

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Search a City',
          style: TextStyle(
            color: Colors.white
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Center(
          child: TextFormField(
            onFieldSubmitted: (value)async{
             var getWeatherCubit= BlocProvider.of<GetWeatherCubit>(context);
             getWeatherCubit.getWeather(value);
            Navigator.pop(context);
            },
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 30,horizontal: 16.0),
              suffixIcon: Icon(Icons.search),
              hintText: 'Enter City Name',
              labelText: 'Search',
              border: OutlineInputBorder(

              ),
            ),
          ),
        ),
      ),
    );
  }
}
