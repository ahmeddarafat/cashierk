class ApiConstants {
  ApiConstants._();

  /// Auth
  static const name = "name";
  static const email = "email";
  static const password = "password";
  static const accessToken = "access_token";
  static const user = "user";
  static const message = "message";
  static const status = "status";
  static const phone = "phone";

  /// Order
  static const orderNumber = "order_number";
  static const orderStatus = "order_status";
  static const orderTotal = "order_total";
  static const unitPrice = "unit_price";
  static const quantity = "quantity";
  static const productImage = "product_image";
  static const productName = "product_name";
  static const orderItems = "order_items";
  static const orderDate = "order_date";
  static const productUnit = "product_unit";
  static const productId = "product_id";
  static const category = "category";

  /// Payment
  static const token = "token";
  static const apiKey = "api_key";
  static const authToken = "auth_token";
  static const deliveryNeeded = "delivery_needed";
  static const amountCents = "amount_cents";
  static const currency = "currency";
  static const items = "items";
  static const orderId = "order_id";
  static const expiration = "expiration";
  static const integrationId = "integration_id";
}

class EndPoints {
  EndPoints._();

  /// Url
  static const serverBaseUrl = "https://cashierc.pharmaco-medica.com/api";
  static const paymentBaseUrl = "https://accept.paymob.com/api";
  // static const fcmBaseUrl = "https://fcm.googleapis.com/fcm";

  // /// notification
  // static const fcmSend = "/send";
  // static const fcmAuth =
  //     "AAAAItfTFCA:APA91bENlDihkLeUXYHHbUKz3P9LT_uG_70Zot89voqThP3N9XAayZOiViDNO-8BhGO68qlW2xG56nW2V6rMO3VGBTnERtnBNDstaQCy1zR_vuM__JBBletmURRSbS9ifAVnCCASnU6D";

  /// Auth
  static const login = "/auth/login";
  static const register = "/auth/register";
  static const profile = "/auth/user-profile";
  static const forgotPassword = "/password/forget-password";
  static const resetPassword = "/password/reset";
  static const logout = "/auth/logout";

  /// order
  static const orders = "/orders";

  /// Payment
  static const authToken = "/auth/tokens";
  static const orderId = "/ecommerce/orders";
  static const paymentId = "/acceptance/payment_keys";
  static const kiosk = "/acceptance/payments/pay";
}

class ApiHeaders {
  ApiHeaders._();

  static const contentType = "content-type";
  static const applicationJson = "application/json";
  static const accept = "accept";
}
