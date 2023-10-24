enum OrderStatus { delivered, processing, cancelled }

extension OrderStatusExt on OrderStatus {
  String value() {
    switch (this) {
      case OrderStatus.delivered:
        return 'Delivered';
      case OrderStatus.processing:
        return 'Processing';
      case OrderStatus.cancelled:
        return 'Cancelled';

      default:
        return "N/A";
    }
  }
}
