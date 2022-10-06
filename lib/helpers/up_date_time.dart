String _trimToRightPlaces(String str, int len) {
  String input = "00$str";
  if (input.length > len) {
    String result = input.substring(input.length - len, input.length);
    return result;
  }
  return input;
}

String formatSecondsTime(int seconds) {
  if (seconds > 0) {
    int h = (seconds / 3600).floor();
    seconds = seconds - (h * 3600);
    int m = (seconds / 60).floor();
    int s = (seconds % 60).round();
    String hStr = _trimToRightPlaces("$h", 2);
    String mStr = _trimToRightPlaces("$m", 2);
    String sStr = _trimToRightPlaces("$s", 2);
    return "$hStr:$mStr:$sStr";
  } else {
    return "00:00";
  }
}

String formatMinutesTime(int minutes) {
  if (minutes > 0) {
    int h = (minutes / 60).floor();
    int m = (minutes % 60).round();
    String hStr = _trimToRightPlaces("$h", 2);
    String mStr = _trimToRightPlaces("$m", 2);
    return "$hStr:$mStr";
  } else {
    return "00:00";
  }
}
