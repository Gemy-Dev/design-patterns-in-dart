import 'package:desing_pattern_in_dart/observer/custmer.dart';
import 'package:desing_pattern_in_dart/observer/market_place.dart';
import 'package:desing_pattern_in_dart/observer/notify_type.dart';

void main(List<String> args) {
  print('Observer Pattern in Dart');
  // Create a marketplace
  final marketPlace = MarketPlace();
  // Create customers
  final customer1 = Customer('Alice');
  final customer2 = Customer('Bob');
  // Subscribe customers to the marketplace
  marketPlace.subscribe(subscriber: customer1, type: NotifyType.productAdded);
  marketPlace.subscribe(subscriber: customer2, type: NotifyType.offerAdded);
  // Add products and offers
  marketPlace.addProduct('Laptop');
  marketPlace.addOffer('20% off on all electronics');
}
