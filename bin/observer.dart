import 'package:desing_pattern_in_dart/observer/custmer.dart';
import 'package:desing_pattern_in_dart/observer/market_place.dart';
import 'package:desing_pattern_in_dart/observer/event_type.dart';
import 'package:desing_pattern_in_dart/observer/offer.dart';
import 'package:desing_pattern_in_dart/observer/product.dart';

void main(List<String> args) {
  print('Observer Pattern in Dart');
  // Create a marketplace
  final marketPlace = MarketPlace();
  // Create customers
  final customer1 = Customer('Alice');
  final customer2 = Customer('Bob');
  // Subscribe customers to the marketplace
  marketPlace.subscribe(subscriber: customer1, type: EventType.productAdded);
  marketPlace.subscribe(subscriber: customer2, type: EventType.offerAdded);
  // Add products and offers
  marketPlace.addProduct(Product('Laptop', 250));
  marketPlace.addOffer(Offer('20% off on all electronics'));
}
