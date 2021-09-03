import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final dynamic id;
  final String name;
  final String? description;
  final String? image;

  const Product({
    required this.id,
    required this.name,
    this.description,
    this.image,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        image,
      ];
}
