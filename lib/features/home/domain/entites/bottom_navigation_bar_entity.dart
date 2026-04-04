import 'package:home_dreams/core/utils/app_images.dart';

class BottomNavigationBarEntity {
  final String inActiveImage;
  final String activeImage;
  BottomNavigationBarEntity({
    required this.activeImage,
    required this.inActiveImage,
  });
}

List<BottomNavigationBarEntity> get bottomNavigationBarItems => [
  BottomNavigationBarEntity(
    activeImage: Assets.assetsImagesHomeIconActive,
    inActiveImage: Assets.assetsImagesHomeIcon,
  ),
  BottomNavigationBarEntity(
    activeImage: Assets.assetsImagesProductIconActive,
    inActiveImage: Assets.assetsImagesProductIcon,
  ),
  BottomNavigationBarEntity(
    activeImage: Assets.assetsImagesCartIconActive,
    inActiveImage: Assets.assetsImagesCartIcon,
  ),
  BottomNavigationBarEntity(
    activeImage: Assets.assetsImagesProfileIconActive,
    inActiveImage: Assets.assetsImagesProfileIcon,
  ),
];
