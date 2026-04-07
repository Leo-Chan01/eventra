import 'package:lottie/lottie.dart';

Future<LottieComposition?> customDecoder(List<int> bytes) {
  return LottieComposition.decodeZip(
    bytes,
    filePicker: (files) {
      return files
              .where(
                (f) =>
                    f.name.startsWith('animations/') &&
                    f.name.endsWith('.json'),
              )
              .firstOrNull ??
          files
              .where(
                (f) =>
                    f.name.endsWith('.json') &&
                    !f.name.endsWith('manifest.json'),
              )
              .firstOrNull;
    },
  );
}
