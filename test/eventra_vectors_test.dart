import 'dart:io';

import 'package:eventra/resources/resources.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('eventra_vectors assets test', () {
    expect(File(EventraVectors.clientVector).existsSync(), isTrue);
    expect(File(EventraVectors.eventraBlackText).existsSync(), isTrue);
    expect(File(EventraVectors.eventraPrimaryText).existsSync(), isTrue);
    expect(File(EventraVectors.vendorVector).existsSync(), isTrue);
  });
}
