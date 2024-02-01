import 'dart:async';
import 'package:stacked/stacked.dart';

class QuoteProgressIndicatorViewModel extends StreamViewModel<double> {
  late Timer timer;

  QuoteProgressIndicatorViewModel() {
    data = 0;

    timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
        if (data! < 9) {
          data = data! + 1;
        } else {
          data = 0;
        }
    });
  }

  @override
  Stream<double> get stream => getTimerStream();

  Stream<double> getTimerStream() async* {
    while (true) {
      await Future.delayed(const Duration(seconds: 1));
      yield data!;
    }
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
}
