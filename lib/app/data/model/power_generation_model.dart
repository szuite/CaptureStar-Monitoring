class PowerGenerationModel {
  final DateTime date;
  final double powerGeneration;

  PowerGenerationModel({required this.date, required this.powerGeneration});

  PowerGenerationModel.fromJson(Map<String, dynamic> json)
    : date = DateTime.parse(json['date']),
      powerGeneration = json['power_generation'].toDouble();


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['date'] = date;
    data['power_generation'] = powerGeneration;

    return data;
  }
}