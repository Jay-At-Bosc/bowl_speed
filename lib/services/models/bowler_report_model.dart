class BowlerReport {
  final String name;
  final double minSpeed;
  final double avgSpeed;
  final double maxSpeed;

  BowlerReport({
    required this.name,
    required this.minSpeed,
    required this.avgSpeed,
    required this.maxSpeed,
  });

  // Convert a BowlerReport into a Map. The keys must correspond to the column names in the database.
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'minSpeed': minSpeed,
      'avgSpeed': avgSpeed,
      'maxSpeed': maxSpeed,
    };
  }

  // A method that converts a map into a BowlerReport.
  factory BowlerReport.fromMap(Map<String, dynamic> map) {
    return BowlerReport(
      name: map['name'] ?? '',
      minSpeed: map['minSpeed']?.toDouble() ?? 0.0,
      avgSpeed: map['avgSpeed']?.toDouble() ?? 0.0,
      maxSpeed: map['maxSpeed']?.toDouble() ?? 0.0,
    );
  }

  // Optionally, override the toString method to make it easier to print and debug the model.
  @override
  String toString() {
    return 'BowlerReport{name: $name, minSpeed: $minSpeed, avgSpeed: $avgSpeed, maxSpeed: $maxSpeed}';
  }
}
