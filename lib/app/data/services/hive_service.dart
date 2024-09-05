import 'dart:async';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:math_solver/app/data/models/response_model.dart';

class HiveService {
  static final HiveService _instance = HiveService._internal();
  factory HiveService() => _instance;
  late Box _mathBox;
  late Box _appPreferances;
  late Box _userRights;
  final int initialUsageRight = 1;

  HiveService._internal();

  Future init() async {
    _mathBox = await Hive.openBox('MathBox');
    //
    _appPreferances = await Hive.openBox('AppPref');
    //
    _userRights = await Hive.openBox('UserRights');
    //

    if (_appPreferances.get('premium') == null) {
      await _appPreferances.put('premium', false);
    }
    if (_appPreferances.get('firstLaunch') == null) {
      await _appPreferances.put('firstLaunch', true);
    }
  }
  
  Future canUseFeature() async {
    final isPremium = getPreferences('premium') ?? false;
    if(isPremium)
    {
      return true;
    }

    final currentDate = DateTime.now();
    DateTime? lastUsage = _userRights.get('lastUsage');
    int remainingRights = _userRights.get('usageCount') ?? 1;

    if (lastUsage == null || !_isSameDay(currentDate, lastUsage)) {
      await _userRights.put('usageCount', initialUsageRight);
      await _userRights.put('lastUsage', currentDate);
      remainingRights = initialUsageRight;
    }

    return remainingRights > 0;
  }

  void userUsedRights() async {
    final isPremium = getPreferences('premium') ?? false;
    if(!isPremium)
    {
      int remainingRights = _userRights.get('usageCount') ?? 1;
      await _userRights.put('usageCount', remainingRights - 1);
      await _userRights.put('lastUsage', DateTime.now());
    }
  }

  bool _isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }

  Future changePremiumState(bool value) async {
    await _appPreferances.put('premium', value);
  }

  Future arrangeLaunch(bool value) async {
    await _appPreferances.put('firstLaunch', value);
  }

  bool? getPreferences(String key) {
    return _appPreferances.get(key);
  }

  Future addMathItem(ResponseModel math) async {
  String formattedDate = DateFormat('MMMM, dd, yyyy').format(DateTime.now());
  int timestamp = DateTime.now().millisecondsSinceEpoch;
  await _mathBox.put(math.id, {
    'date': formattedDate,
    'timestamp': timestamp,
    'math': math
  });
}

  Map getMathItem(String key) {
    return _mathBox.get(key);
  }

  Future deleteMathItem(String key) async {
    await _mathBox.delete(key);
  }

  List getAllMathItems() {
    return _mathBox.values.toList();
  }

  void deleteMathFromDisk() {
    _mathBox.deleteFromDisk();
  }

  void deleteUsageFromDisk() {
    _userRights.deleteFromDisk();
  }


Map getQuestionsGroupedByDate() {
  final allItems = _mathBox.values.toList();

  final Map<String, List<dynamic>> questionsByDate = {};

  for (var item in allItems) {
    final String date = item['date'] as String;
    final math = item['math'] as ResponseModel;
    final int timestamp = item['timestamp'] as int;

    if (!questionsByDate.containsKey(date)) {
      questionsByDate[date] = [];
    }

    questionsByDate[date]!.add({'timestamp': timestamp, 'math': math});
  }

  final sortedKeys = questionsByDate.keys.toList()
    ..sort((a, b) => DateFormat('MMMM, dd, yyyy')
        .parse(b)
        .compareTo(DateFormat('MMMM, dd, yyyy').parse(a)));

  final Map sortedQuestionsByDate = {};

  for (var key in sortedKeys) 
  {
    final List itemsForDate = questionsByDate[key]!;

    itemsForDate.sort((a, b) => b['timestamp'].compareTo(a['timestamp']));


    sortedQuestionsByDate[key] = itemsForDate
        .map((item) => item['math'] as ResponseModel)
        .toList();
  }

  return sortedQuestionsByDate;
}
}