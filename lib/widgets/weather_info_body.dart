import 'package:flutter/cupertino.dart';
import '../models/weather_model.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({super.key, required this.weatherModel});
  final WeatherModel weatherModel;

  @override
  Widget build(BuildContext context) {
   //var weatherModel= BlocProvider.of<GetWeatherCubit>(context).weatherModel;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 23.0),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(weatherModel.cityName,
              style: const TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold
              ),),
            Text(
              'updated at ${weatherModel.date.hour}:${weatherModel.date.minute}',
              style: const TextStyle(
                fontSize: 25.0,
              ),),
            const SizedBox(height: 16.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.network('https:${weatherModel.image}'),
                Text("${weatherModel.temp.round()}",
                  style: const TextStyle(
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold
                  ),),
                Column(
                  children: [
                    Text('${weatherModel.maxTemp.round()}',
                      style: const TextStyle(
                        fontSize: 16,
                      ),),
                    Text('${weatherModel.minTemp.round()}',
                      style: const TextStyle(
                        fontSize: 16,
                      ),),

                  ],
                )
              ],
            ),
            const SizedBox(height: 16.0,),
            Text(weatherModel.weatherCondition,
              style: const TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold
              ),),

          ],
        ),
      ),
    );
  }
}

