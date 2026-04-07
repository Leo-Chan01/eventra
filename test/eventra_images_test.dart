import 'dart:io';

import 'package:eventra/resources/resources.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('eventra_images assets test', () {
    expect(File(EventraImages.appIcon).existsSync(), isTrue);
    expect(
      File(EventraImages.bartenderPreparingDrinkBar1).existsSync(),
      isTrue,
    );
    expect(File(EventraImages.cakesCategoryIcon).existsSync(), isTrue);
    expect(File(EventraImages.cameramanImage).existsSync(), isTrue);
    expect(File(EventraImages.decoratorPerson).existsSync(), isTrue);
    expect(File(EventraImages.decoratorCategoryIcon).existsSync(), isTrue);
    expect(
      File(EventraImages.femaleWeddingPlannerWorkingCeremony1).existsSync(),
      isTrue,
    );
    expect(File(EventraImages.headerCarouselImage).existsSync(), isTrue);
    expect(File(EventraImages.logoIconSmall).existsSync(), isTrue);
    expect(File(EventraImages.logoText).existsSync(), isTrue);
    expect(File(EventraImages.onboardingImage1).existsSync(), isTrue);
    expect(File(EventraImages.onboardingImage2).existsSync(), isTrue);
    expect(File(EventraImages.onboardingImgae3).existsSync(), isTrue);
    expect(File(EventraImages.profileDummy).existsSync(), isTrue);
    expect(File(EventraImages.rentalCategoryIcon).existsSync(), isTrue);
    expect(File(EventraImages.weddingImage).existsSync(), isTrue);
    expect(File(EventraImages.womanWithfoodplate).existsSync(), isTrue);
    expect(File(EventraImages.womanWithweddinggown).existsSync(), isTrue);
  });
}
