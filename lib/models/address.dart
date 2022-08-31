class Address {
  String place = "المنزل";

  String name;
  String region;
  String state;
  String city;
  String street;
  String phone;
  Address(
      {required this.place,
      required this.name,
      required this.region,
      required this.state,
      required this.city,
      required this.street,
      required this.phone});

  Map<String, dynamic> toMap() {
    return {
      'city': city,
      'name': name,
      'phone': phone,
      'place': place,
      'region': region,
      'state': state,
      'street': street
    };
  }
}
