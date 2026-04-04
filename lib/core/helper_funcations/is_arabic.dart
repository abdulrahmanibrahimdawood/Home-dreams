import 'package:intl/intl.dart';

bool isArabic() {
  return Intl.getCurrentLocale() == 'ar' ? true : false;
}
