import 'package:sleepguard_app/modules/home/models/models.dart';

class EnvironmentModel {
  final bool moviment;
  final int temperature;
  final int humidity;
  final PositionModel position;

  const EnvironmentModel({
    required this.moviment,
    required this.temperature,
    required this.humidity,
    required this.position,
  });

  factory EnvironmentModel.fromJson(Map json) {
    return EnvironmentModel(
      moviment: json['movimento'],
      temperature: json['temperatura'],
      humidity: json['umidade'],
      position: PositionModel.fromJson(json['posicao']),
    );
  }
}