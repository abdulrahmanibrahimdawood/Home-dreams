import 'package:home_dreams/core/utils/app_images.dart';

class BottomNavigationBarEntity {
  final String name;
  final String inActiveImage;
  final String activeImage;
  BottomNavigationBarEntity({
    required this.name,
    required this.activeImage,
    required this.inActiveImage,
  });
}

List<BottomNavigationBarEntity> get bottomNavigationBarItems => [
  BottomNavigationBarEntity(
    name: 'الرئيسية',
    activeImage: Assets.assetsImagesHomeIconActive,
    inActiveImage: Assets.assetsImagesHomeIcon,
  ),
  BottomNavigationBarEntity(
    name: 'المنتجات',
    activeImage: Assets.assetsImagesProductIconActive,
    inActiveImage: Assets.assetsImagesProductIcon,
  ),
  BottomNavigationBarEntity(
    name: 'سلة التسوق',
    activeImage: Assets.assetsImagesCartIconActive,
    inActiveImage: Assets.assetsImagesCartIcon,
  ),
  BottomNavigationBarEntity(
    name: 'حسابي',
    activeImage: Assets.assetsImagesProfileIconActive,
    inActiveImage: Assets.assetsImagesProfileIcon,
  ),
];
