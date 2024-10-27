class DateUtil {
  static String getMonth(DateTime date, String lang) {
    switch (date.month) {
      case 1:
        return lang == 'en' ? 'Jan' : 'يناير';
      case 2:
        return lang == 'en' ? 'Feb' : 'فبراير';
      case 3:
        return lang == 'en' ? 'Mar' : 'مارس';
      case 4:
        return lang == 'en' ? 'Apr' : 'إبريل';
      case 5:
        return lang == 'en' ? 'May' : 'مايو';
      case 6:
        return lang == 'en' ? 'Jun' : 'يونيو';
      case 7:
        return lang == 'en' ? 'Jul' : 'يوليو';
      case 8:
        return lang == 'en' ? 'Aug' : 'أغسطس';
      case 9:
        return lang == 'en' ? 'Sept' : 'سبتمبر';
      case 10:
        return lang == 'en' ? 'Oct' : 'أكتوبر';
      case 11:
        return lang == 'en' ? 'Nov' : 'نوفمبر';
      case 12:
        return lang == 'en' ? 'Dec' : 'ديسمبر';
    }
    return 'NA';
  }
}
