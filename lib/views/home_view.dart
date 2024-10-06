import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/views/search_view.dart';
import 'package:weather_app/widgets/no-weather_body.dart';
import 'package:weather_app/widgets/weather_info_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          "Weather App",
          style: TextStyle(
            color: Colors.white
          ),
        ),
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>const SearchView(),),);
          }, icon: const Icon(Icons.search,
            color: Colors.white,
          ),)
        ],
      ),
      body: BlocBuilder<GetWeatherCubit,WeatherState>(
          builder: (BuildContext context, state) {
            if(state is NoWeatherState){
              return const NoWeatherBody();
            }else if(state is WeatherLoadedState){
              return WeatherInfoBody(
                weatherModel: state.weatherModel,
              );
            }else {
              return const Text('oops there was an error');
            }
          })

    );
  }
}
