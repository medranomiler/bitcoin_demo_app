class SharedDataService {
  double? sharedData;

  static final SharedDataService _instance = SharedDataService._internal();

  factory SharedDataService() {
    return _instance;
  }

  SharedDataService._internal();
}
