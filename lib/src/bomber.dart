// ignore_for_file: invalid_use_of_internal_member

part of smsbomber;

class Bomber {
  final Country _country;

  final List<Service> _services;
  final PhoneNumber _phoneNumber;

  Bomber({
    required String phone,
    required Country country,
    List<Service>? services,
  })  : _country = country,
        _services = services ?? serviceList,
        _phoneNumber = PhoneParser.fromRaw(phone) {
    // ignore: unrelated_type_equality_checks
    if (_country != _phoneNumber.isoCode) {
      throw const BomberException("The phone number does not match the country indicated");
    }

    if (!PhoneParser.validate(_phoneNumber, PhoneNumberType.mobile)) {
      throw const BomberException("Phone number is not valid");
    }
  }

  Future<List<void>> start() {
    final services = _services.where((element) => element.country == _country);

    return Future.wait(services.map((e) => e.init(_phoneNumber)));
  }
}
