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
    expect(File(EventraImages.bouncersCategoryImage).existsSync(), isTrue);
    expect(File(EventraImages.cakesCategoryIcon).existsSync(), isTrue);
    expect(File(EventraImages.cameramanImage).existsSync(), isTrue);
    expect(File(EventraImages.catererCategoryImage).existsSync(), isTrue);
    expect(
      File(EventraImages.contentCreatorCategoryImage).existsSync(),
      isTrue,
    );
    expect(File(EventraImages.decoratorPerson).existsSync(), isTrue);
    expect(File(EventraImages.decoratorCategoryIcon).existsSync(), isTrue);
    expect(File(EventraImages.djCategoryImage).existsSync(), isTrue);
    expect(File(EventraImages.drinksCategoryImage).existsSync(), isTrue);
    expect(File(EventraImages.eventplannerCategoryImage).existsSync(), isTrue);
    expect(
      File(EventraImages.femaleWeddingPlannerWorkingCeremony1).existsSync(),
      isTrue,
    );
    expect(File(EventraImages.hairStylistCategoryImage).existsSync(), isTrue);
    expect(File(EventraImages.hallCategoryImage).existsSync(), isTrue);
    expect(File(EventraImages.headerCarouselImage).existsSync(), isTrue);
    expect(File(EventraImages.ligntningCategoryImage).existsSync(), isTrue);
    expect(File(EventraImages.liveBandCategoryImage).existsSync(), isTrue);
    expect(File(EventraImages.logoIconSmall).existsSync(), isTrue);
    expect(File(EventraImages.logoText).existsSync(), isTrue);
    expect(File(EventraImages.makeUpCategoryImage).existsSync(), isTrue);
    expect(File(EventraImages.mcCategoryImage).existsSync(), isTrue);
    expect(File(EventraImages.nigeriaFlagInCircle).existsSync(), isTrue);
    expect(File(EventraImages.onboardingImage1).existsSync(), isTrue);
    expect(File(EventraImages.onboardingImage2).existsSync(), isTrue);
    expect(File(EventraImages.onboardingImgae3).existsSync(), isTrue);
    expect(File(EventraImages.photographyCategoryImage).existsSync(), isTrue);
    expect(File(EventraImages.profileDummy).existsSync(), isTrue);
    expect(File(EventraImages.rentalCategoryIcon).existsSync(), isTrue);
    expect(File(EventraImages.searchResultNotFoundImage).existsSync(), isTrue);
    expect(File(EventraImages.smallChopsCategoryImage).existsSync(), isTrue);
    expect(
      File(EventraImages.transactionHistoryNotificationEmpty).existsSync(),
      isTrue,
    );
    expect(File(EventraImages.usherCategoryImage).existsSync(), isTrue);
    expect(File(EventraImages.videographerCategoryImage).existsSync(), isTrue);
    expect(File(EventraImages.weddingDressCategoryImage).existsSync(), isTrue);
    expect(File(EventraImages.weddingImage).existsSync(), isTrue);
    expect(
      File(EventraImages.weddingStylistCategoryImage).existsSync(),
      isTrue,
    );
    expect(File(EventraImages.womanWithfoodplate).existsSync(), isTrue);
    expect(File(EventraImages.womanWithweddinggown).existsSync(), isTrue);
    expect(File(EventraImages.yourInboxIsEmptyImage).existsSync(), isTrue);
  });
}
