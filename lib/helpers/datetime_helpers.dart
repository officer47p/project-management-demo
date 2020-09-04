String dateStringMaker(DateTime dt) {
  return "${dt.year}/${dt.month.toString().padLeft(2, '0')}/${dt.day.toString().padLeft(2, '0')}";
}

String timeStringMaker(DateTime dt) {
  return "${dt.hour.toString().padLeft(2, '0')}:${dt.minute.toString().padLeft(2, '0')}:${dt.second.toString().padLeft(2, '0')}";
}
