part of smsbomber;

typedef _Process = Future Function(Service service, String phone);

class Service {
  final String name;
  final Uri url;
  final Country country;
  final _Process _process;

  const Service(
      {required this.name, required this.url, required this.country, required _Process process})
      : _process = process;

  Future<void> init(PhoneNumber phone) async {
    if (countyList[phone.isoCode] != country) {
      throw Exception("Phone is invalid");
    }

    await _process(this, phone.nsn);
  }
}
