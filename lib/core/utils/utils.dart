import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

String fixedString(String str, int length) {
  if (str.length <= length) {
    return str;
  }

  return "${str.substring(0, length)}...";
}

Future<String> getDayName(DateTime date) async {
  await initializeDateFormatting('es_ES', null);

  return DateFormat.EEEE('es_ES').format(date);
}

Future<String> getMonthName(DateTime date) async {
  await initializeDateFormatting('es_ES', null);

  return DateFormat.MMMM('es_ES').format(date);
}

String capitalizeFirstLetter(String text) {
  if (text.isEmpty) {
    return text;
  }
  return text[0].toUpperCase() + text.substring(1);
}
