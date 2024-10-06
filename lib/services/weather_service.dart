import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  final Dio dio;
  final String cityName;
  final String baseUrl = 'https://api.weatherapi.com/v1';
  final String apiKey = '85b2e20fdefa4d57bbf00349240610';

  WeatherService(this.dio, {required this.cityName});
  Future<WeatherModel> getCurrentWeather() async {
    try {
      Response response = await dio.get(
          '$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1');
      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    }on DioException catch(e){
      final String errorMessage =e.response?.data['error']['message'] ?? 'oops there was an error, try later';
      throw Exception(errorMessage);
    }catch(e){
      throw Exception('oops there was an error, try later');
    }
  }


}
