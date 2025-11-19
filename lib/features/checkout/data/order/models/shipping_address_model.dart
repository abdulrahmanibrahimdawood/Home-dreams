import 'package:home_dreams/features/checkout/domain/entites/shipping_address_entity.dart';

class ShippingAddressModel {
  String? name;
  String? phone;
  String? address;
  String? city;
  String? email;
  String? floor;

  ShippingAddressModel({
    this.name,
    this.phone,
    this.address,
    this.city,
    this.email,
    this.floor,
  });
  factory ShippingAddressModel.fromEntity(ShippingAddressEntity entity) {
    return ShippingAddressModel(
      name: entity.name,
      phone: entity.phone,
      address: entity.address,
      city: entity.city,
      email: entity.email,
      floor: entity.floor,
    );
  }
  toJson() {
    return {
      'name': name,
      'phone': phone,
      'address': address,
      'city': city,
      'email': email,
      'floor': floor,
    };
  }
}
