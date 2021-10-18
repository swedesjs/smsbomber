part of smsbomber;

typedef _Process = Future<Response> Function(Service service, String phone);

Future<Response> _serviceProcessFunctionDefault(
  Service service,
  String phone,
) =>
    _dio.post(
      service.url.toString().replaceFirst("%7Bphone%7D", "$phone"),
    );

class Service {
  final String name;
  final Uri url;
  final Country country;
  final _Process _process;

  const Service({
    required this.name,
    required this.url,
    required this.country,
    _Process process = _serviceProcessFunctionDefault,
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
