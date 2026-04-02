import 'dart:io';

import 'package:eventra/resources/resources.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('eventra_anims assets test', () {
    expect(File(EventraAnims.confettiEmoji).existsSync(), isTrue);
    expect(File(EventraAnims.success).existsSync(), isTrue);
  });
}
