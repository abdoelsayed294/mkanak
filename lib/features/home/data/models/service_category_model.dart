import 'package:flutter/material.dart';

class ServiceCategoryModel {
  final String id;
  final String nameEn;
  final IconData icon;

  const ServiceCategoryModel({
    required this.id,
    required this.nameEn,
    required this.icon,
  });

  static const List<ServiceCategoryModel> dailyServices = [
    ServiceCategoryModel(id: 'all', nameEn: 'All', icon: Icons.explore),
    ServiceCategoryModel(
      id: 'supermarket',
      nameEn: 'Supermarket',
      icon: Icons.shopping_cart_outlined,
    ),
    ServiceCategoryModel(
      id: 'laundry',
      nameEn: 'Laundry',
      icon: Icons.local_laundry_service_outlined,
    ),
    ServiceCategoryModel(
      id: 'restaurant',
      nameEn: 'Restaurant',
      icon: Icons.restaurant_outlined,
    ),
    ServiceCategoryModel(
      id: 'cafe',
      nameEn: 'Cafe',
      icon: Icons.local_cafe_outlined,
    ),
    ServiceCategoryModel(
      id: 'bakery',
      nameEn: 'Bakery',
      icon: Icons.bakery_dining_outlined,
    ),
  ];
}
