import 'package:desing_pattern_in_dart/observer/event_type.dart';
import 'package:desing_pattern_in_dart/observer/offer.dart';
import 'package:desing_pattern_in_dart/observer/product.dart';
import 'package:desing_pattern_in_dart/observer/subscriper.dart';

class MarketPlace {
  late final Map<EventType, List<Subscriber>> _subscribers;
  late final List<Product> _products;
  late final List<Offer> _offers;
  MarketPlace() {
    _offers = [];
    _products = [];
    _subscribers = {EventType.productAdded: [], EventType.offerAdded: []};
  }

  void subscribe({required Subscriber subscriber, required EventType type}) {
    _subscribers[type]?.add(subscriber);
  }

  void unsubscribe({required Subscriber subscriber, required EventType type}) {
    _subscribers[type]?.remove(subscriber);
  }

  void addProduct(Product product) {
    _products.add(product);
    _notifySubscribers<String>(
      data: 'New product added: ${product.name} with Price ${product.price}',
      type: EventType.productAdded,
    );
  }

  void addOffer(Offer offer) {
    _offers.add(offer);
    _notifySubscribers<String>(
      data: 'New offer added: ${offer.message}',
      type: EventType.offerAdded,
    );
  }

  void _notifySubscribers<T>({required T data, required EventType type}) {
    _subscribers[type]?.forEach((subscriper) => subscriper.notify(data));
  }
}
