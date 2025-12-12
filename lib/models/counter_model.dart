class CounterModel {
  String name;
  int value;
  int colorValue;

  CounterModel({required this.name, this.value = 0, required this.colorValue});

  Map<String, dynamic> toJson() =>
      {'name': name, 'value': value, 'color': colorValue};

  factory CounterModel.fromJson(Map<String, dynamic> json) => CounterModel(
        name: json['name'],
        value: json['value'],
        colorValue: json['color'],
      );
}
