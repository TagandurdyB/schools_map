class SchoolModel {
  String? region;
  String name;
  String? address;
  String? phone;
  String? buildYear;
  String? image;
  double? lat;
  double? long;
  SchoolModel({
    required this.region,
    required this.name,
    this.address,
    this.phone,
    this.buildYear,
    this.image,
    this.lat,
    this.long,
  });

  SchoolModel copyWith({
    String? region,
    String? name,
    String? address,
    String? phone,
    String? buildYear,
    String? image,
    double? lat,
    double? long,
  }) {
    return SchoolModel(
      region: region ?? this.region,
      name: name ?? this.name,
      address: address ?? this.address,
      phone: phone ?? this.phone,
      buildYear: buildYear ?? this.buildYear,
      image: image ?? this.image,
      lat: lat ?? this.lat,
      long: long ?? this.long,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'region': region,
      'name': name,
      'address': address,
      'phone': phone,
      'buildYear': buildYear,
      'image': image,
      'lat': lat,
      'long': long,
    };
  }

// number,address,phone,build_year
  factory SchoolModel.fromMap(Map map) {
    print("+++SchoolModel:=$map");
    return SchoolModel(
      region: map['region'],
      name: map['number'],
      address: map['address'],
      phone: map['phone'],
      buildYear: map['build_year'],
      image: map['image'],
      lat: map['lat'],
      long: map['long'],
    );
  }


  @override
  bool operator ==(covariant SchoolModel other) {
    if (identical(this, other)) return true;

    return other.region == region &&
        other.name == name &&
        other.address == address &&
        other.phone == phone &&
        other.buildYear == buildYear &&
        other.image == image &&
        other.lat == lat &&
        other.long == long;
  }

  @override
  int get hashCode {
    return region.hashCode ^
        name.hashCode ^
        address.hashCode ^
        phone.hashCode ^
        buildYear.hashCode ^
        image.hashCode ^
        lat.hashCode ^
        long.hashCode;
  }
}
