import "package:smsbomber/smsbomber.dart";

void main() async {
  final bomber = Bomber(phone: "+7 900 000 00 00", country: Country.RU);

  await bomber.start();
}
