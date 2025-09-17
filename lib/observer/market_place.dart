import 'package:desing_pattern_in_dart/observer/notify_type.dart';
import 'package:desing_pattern_in_dart/observer/subscriper.dart';

class MarketPlace {
  late final Map<NotifyType, List<Subscriber>> _subscribers;
  late final List<String> _products;
  late final List<String> _offers;
  MarketPlace() {
    _offers = [];
    _products = [];
    _subscribers = {NotifyType.productAdded: [], NotifyType.offerAdded: []};
  }

  void subscribe({required Subscriber subscriber, required NotifyType type}) {
    _subscribers[type]?.add(subscriber);
  }

  void unsubscribe({required Subscriber subscriber, required NotifyType type}) {
    _subscribers[type]?.remove(subscriber);
  }

  void addProduct(String product) {
    _products.add(product);
    _notifySubscribers<String>(
      data: 'New product added: $product',
      type: NotifyType.productAdded,
    );
  }

  void addOffer(String offer) {
    _offers.add(offer);
    _notifySubscribers<String>(
      data: 'New offer added: $offer',
      type: NotifyType.offerAdded,
    );
  }

  void _notifySubscribers<T>({required T data, required NotifyType type}) {
    _subscribers[type]?.forEach((subscriper) => subscriper.notify(data));
  }
}
