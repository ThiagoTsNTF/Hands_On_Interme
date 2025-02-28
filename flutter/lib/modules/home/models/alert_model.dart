class AlertModel {
  final String hour;
  final String message;

  const AlertModel({required this.hour, required this.message});

  factory AlertModel.fromJson(Map json) {
    return AlertModel(
      hour: json['horario'],
      message: json['mensagem'],
    );
  }
}