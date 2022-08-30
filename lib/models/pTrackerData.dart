class Data{
  final DateTime date;
  final int weight;

  Data({
    required this.date,
    required this.weight
});

  Map<String, dynamic> toJson() => {
    'date' : date,
    'weight' : weight
  };

  static Data fromJson(Map<String, dynamic> json) => Data(
      date: json['date'],
      weight: json['weight']
  );
}