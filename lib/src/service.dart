part of smsbomber;

typedef _Process = Future<Response> Function(Service service, String phone);

class Service {
  final String name;
  final Uri url;
  final Country country;
  final _Process _process;

  const Service({
    required this.name,
    required this.url,
    required this.country,
    required _Process process,
  }) : _process = process;

  Future<void> init(PhoneNumber phone) async {
    if (countyList[phone.isoCode] != country) {
      throw const BomberException("The phone number does not match the country indicated");
    }

    final response = await _process(this, phone.nsn);
    
    print(
      "Init(name: $name, statusCode: ${response.statusCode}, statusMessage: ${response.statusMessage});",
    );
  }
}
