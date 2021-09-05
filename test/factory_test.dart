import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Counter increments smoke test', () async {
    Map<String, dynamic> json = {
      'type': PizzaType.HamMushroom,
      'orderNumber': '12345'
    };
    print(Pizza.fromJson(json).getPrice());
  });
}

enum PizzaType { HamMushroom, Deluxe, Seafood }

abstract class Pizza {
  double getPrice();

  factory Pizza.fromJson(Map<String, dynamic> json) {
    switch (json['type'] as PizzaType) {
      case PizzaType.HamMushroom:
        return HamAndMushroomPizza();
      case PizzaType.Deluxe:
        return DeluxePizza(json['orderNumber'] as String);
      case PizzaType.Seafood:
        return SeafoodPizza();
      default:
        return SeafoodPizza();
    }
  }
}

class HamAndMushroomPizza implements Pizza {
  double price = 10.5;

  @override
  double getPrice() {
    return price;
  }
}

class DeluxePizza implements Pizza {
  double price = 5.5;
  String orderNumber;

  DeluxePizza(this.orderNumber);

  @override
  double getPrice() {
    return price;
  }
}

class SeafoodPizza implements Pizza {
  double price = 7.8;

  @override
  double getPrice() {
    return price;
  }
}
