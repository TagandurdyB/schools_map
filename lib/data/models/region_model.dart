class RegionModel {
  String name;
  String csvPath;
  RegionModel({
    required this.name,
    required this.csvPath,
  });

  RegionModel copyWith({
    String? name,
    String? csvPath,
  }) {
    return RegionModel(
      name: name ?? this.name,
      csvPath: csvPath ?? this.csvPath,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'csvPath': csvPath,
    };
  }

  factory RegionModel.fromMap(Map map) {
    return RegionModel(
      name: map['name'],
      csvPath: map['path'],
    );
  }

  @override
  String toString() => 'RegionModel(name: $name, csvPath: $csvPath)';

  @override
  bool operator ==(covariant RegionModel other) {
    if (identical(this, other)) return true;

    return other.name == name && other.csvPath == csvPath;
  }

  @override
  int get hashCode => name.hashCode ^ csvPath.hashCode;
}
