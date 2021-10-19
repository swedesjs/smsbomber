part of smsbomber;

class Country {
  static const RU = Country("RU");

  final String country;
  const Country(this.country);

  @override
  bool operator ==(Object other) => country == other;

  @override
  String toString() => country;
}
