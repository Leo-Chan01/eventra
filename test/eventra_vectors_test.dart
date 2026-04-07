import 'dart:io';

import 'package:eventra/resources/resources.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('eventra_vectors assets test', () {
    expect(File(EventraVectors.appleIcon).existsSync(), isTrue);
    expect(File(EventraVectors.cautionSignOrange).existsSync(), isTrue);
    expect(File(EventraVectors.chatMessage).existsSync(), isTrue);
    expect(File(EventraVectors.clientVector).existsSync(), isTrue);
    expect(File(EventraVectors.eventraBlackText).existsSync(), isTrue);
    expect(File(EventraVectors.eventraPrimaryText).existsSync(), isTrue);
    expect(File(EventraVectors.filterIcon).existsSync(), isTrue);
    expect(File(EventraVectors.goodCheckGreen).existsSync(), isTrue);
    expect(File(EventraVectors.googleIcon).existsSync(), isTrue);
    expect(File(EventraVectors.homeIconSearchNew).existsSync(), isTrue);
    expect(File(EventraVectors.homeIcon).existsSync(), isTrue);
    expect(File(EventraVectors.homeIconSearch).existsSync(), isTrue);
    expect(File(EventraVectors.infoIcon).existsSync(), isTrue);
    expect(File(EventraVectors.locationPin).existsSync(), isTrue);
    expect(File(EventraVectors.loveButtonVendorDeets).existsSync(), isTrue);
    expect(File(EventraVectors.loveVendorDeets).existsSync(), isTrue);
    expect(File(EventraVectors.mailIcon).existsSync(), isTrue);
    expect(File(EventraVectors.notificationBell).existsSync(), isTrue);
    expect(File(EventraVectors.searchNormal).existsSync(), isTrue);
    expect(File(EventraVectors.shareButtonVendorDeets).existsSync(), isTrue);
    expect(File(EventraVectors.shopIcon).existsSync(), isTrue);
    expect(File(EventraVectors.showcaseIcon).existsSync(), isTrue);
    expect(File(EventraVectors.stickynote).existsSync(), isTrue);
    expect(File(EventraVectors.vendorVector).existsSync(), isTrue);
    expect(File(EventraVectors.verify).existsSync(), isTrue);
  });
}
