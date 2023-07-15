class SunInfo{
    double getPercent(String from, String now, String to) {
    final start = getDuration(from);
    final isNow = getDuration(now);
    final end = getDuration(to);
    if (isNow.inMinutes >= end.inMinutes) {
      return 100.0;
    }
    if (isNow.inMinutes <= start.inMinutes) {
      return 0.0;
    }
    final dayVolume = end.inMinutes - start.inMinutes;
    final nowVolume = isNow.inMinutes - start.inMinutes;
    final filled = (nowVolume / dayVolume) * 100;
    return filled;
  }

  Duration getDuration(String time) {
    int min = int.parse((time.substring(3, 5)).startsWith('0')
        ? time.substring(4, 5)
        : time.substring(3, 5));
    int hour = int.parse((time.substring(0, 2)).startsWith('0')
        ? time.substring(1, 2)
        : time.substring(0, 2));
    return Duration(hours: hour, minutes: min);
  }
}