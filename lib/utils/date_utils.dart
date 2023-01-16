import 'dart:math';

Random random = Random();

DateTime randomDate() {
  var now = DateTime.now();
  var maxYear = now.year + 1;
  var year = now.year + random.nextInt(maxYear - now.year + 1);
  var month = random.nextInt(12) + 1;
  var day = random.nextInt(28) + 1;
  var hour = random.nextInt(24);
  var minute = random.nextInt(60);
  var second = random.nextInt(60);
  return DateTime(year, month, day, hour, minute, second);
}
