class ApplicationUtil {
  static DateTime midnight([DateTime datetime]) {
    DateTime now = datetime ??DateTime.now();
    return  DateTime(now.year,now.month,now.day);
  }
}