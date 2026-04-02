import 'dart:io';

import 'package:eventra/resources/resources.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('eventra_images assets test', () {
    expect(File(EventraImages.appIcon).existsSync(), isTrue);
    expect(File(EventraImages.cakesCategoryIcon).existsSync(), isTrue);
    expect(File(EventraImages.decoratorCategoryIcon).existsSync(), isTrue);
    expect(File(EventraImages.logoIconSmall).existsSync(), isTrue);
    expect(File(EventraImages.logoText).existsSync(), isTrue);
    expect(File(EventraImages.onboardingImage1).existsSync(), isTrue);
    expect(File(EventraImages.onboardingImage2).existsSync(), isTrue);
    expect(File(EventraImages.onboardingImgae3).existsSync(), isTrue);
    expect(File(EventraImages.rentalCategoryIcon).existsSync(), isTrue);
  });
}
