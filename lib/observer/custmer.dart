import 'package:desing_pattern_in_dart/observer/subscriper.dart';

class Customer implements Subscriber<String> {
  final String name;
  Customer(this.name);
  @override
  void notify(String data) {
    print('$name received notification: $data');
  }
}