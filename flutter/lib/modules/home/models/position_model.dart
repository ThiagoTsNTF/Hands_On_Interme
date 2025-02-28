class PositionModel {
  final int x;
  final int y;
  final int z;

  const PositionModel({required this.x, required this.y, required this.z});

  factory PositionModel.fromJson(Map json) {
    return PositionModel(
      x: json['x'],
      y: json['y'],
      z: json['z'],
    );
  }
}