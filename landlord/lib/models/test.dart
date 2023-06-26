import 'package:landlord/models/place.dart';

class PlaceList {
  static List<Place> cache = [
    Place(
      title: 'First Accomodation',
      tenant: 'Tony',
      date: DateTime.now().subtract(Duration(days: 20)),
      info: '',
      addres: 'Zodchih 2',
    ),
    Place(
      title: 'Forth Accomodation',
      tenant: 'Bogdan',
      date: DateTime.now().add(Duration(days: 41)),
      info: '',
      addres: 'Litvinenko',
    ),
    Place(
      title: 'Seconds Accomodation',
      tenant: 'Bogdan',
      date: DateTime.now().subtract(Duration(days: 40)),
      info: '',
      addres: 'Litvinenko',
    ),
    Place(
      title: 'Third Accomodation',
      tenant: 'Bogdan',
      date: DateTime.now().add(Duration(days: 39)),
      info: '',
      addres: 'Litvinenko',
    ),
  ];

  static void addPlace(Place place) {
    cache.add(place);
  }

  static void sortByMonth() {
    /// shell sort
    int gap = 1 + cache.length ~/ 2;
    while (gap > 0) {
      for (int value = gap; value < cache.length; value++) {
        int current_month = cache[value].date.month;
        final current_value = cache[value];
        int position = value;

        while (position >= gap && cache[position - gap].date.month > current_month) {
          cache[position] = cache[position - gap];
          position -= gap;
          cache[position] = current_value;
        }
        gap ~/= 2;
      }
    }
  }

  static void getSortedAccomodationList() {
    /// insertion Sort
    sortByMonth();

    for (int i = 1; i < cache.length; i++) {
      int keyMonth = cache[i].date.month;
      int keyDay = cache[i].date.day;
      final keyData = cache[i];

      int j = i - 1;
      int currentMonth = cache[j].date.month;
      int currentDay = cache[j].date.day;

      while (j >= 0 && currentMonth == keyMonth && currentDay > keyDay) {
        cache[j + 1] = cache[j];
        j--;
        if (j > 0) currentDay = cache[j].date.day;
      }
      cache[j + 1] = keyData;
    }
  }
}
