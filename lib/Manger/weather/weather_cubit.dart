import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weathercubit/Model/model.dart';
import 'package:weathercubit/Services/weather_service.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherInitial());

  getweather({required String city}) async {
    try {
      WeatherModel weatherModel =
          await WeatherService().getWeatherData(cityName: city);
      emit(WeatherILoaded(weatherModel: weatherModel));
    } on Exception catch (e) {
      emit(WeatherFailure());
    }
  }
}
