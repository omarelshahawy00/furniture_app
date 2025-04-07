class FurnitureModel {
  final String id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  final String category;

  FurnitureModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.category,
  });
}

List<FurnitureModel> mockFurnitureList = [
  FurnitureModel(
    id: '1',
    name: 'Modern Sofa',
    description: 'Comfortable 3-seater with soft fabric.',
    price: 12000000000.0,
    imageUrl:
        'https://chichomz.com/cdn/shop/files/QAM12.jpg?v=1722752654&width=533',
    category: 'Living Room',
  ),
  FurnitureModel(
    id: '2',
    name: 'Wooden Dining Table',
    description: 'Seats 6 people, made with oak wood.',
    price: 950000.0,
    imageUrl: 'https://hubfurniture.com.eg/media/catalog/product/3/_/3_6.jpg',
    category: 'Dining Room',
  ),
  FurnitureModel(
    id: '3',
    name: 'King Bed',
    description: 'Large comfortable bed with drawers.',
    price: 1400.0,
    imageUrl:
        'https://i5.walmartimages.com/seo/Dextrus-Bed-Frame-King-Size-Led-4-Storage-Drawers-Adjustable-Upholstered-Headboard-Platform-Wooden-Slats-Support-No-Box-Spring-Needed-Grey_06e4a716-d275-4a11-9d86-ad66bae14c90.bf30238490407147f46810e849bd4bb0.jpeg',
    category: 'Bedroom',
  ),
];
