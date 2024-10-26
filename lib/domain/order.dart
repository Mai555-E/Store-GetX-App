import 'product.dart';

class Order {
 int? quantity  ;
  final Product product;

  Order({required this.product, this.quantity =1});
}
