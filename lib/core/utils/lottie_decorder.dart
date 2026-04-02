import 'package:lottie/lottie.dart';

Future<LottieComposition?> customDecoder(List<int> bytes) {
  return LottieComposition.decodeZip(
    bytes,
    filePicker: (files) {
      // Try the preferred path first
      var file = files
          .where(
            (f) => f.name.startsWith('animations/') && f.name.endsWith('.json'),
          )
          .firstOrNull;

      // Fallback to any JSON file if animations/ folder isn't found, excluding manifest.json
      file ??= files
          .where(
            (f) =>
                f.name.endsWith('.json') && !f.name.endsWith('manifest.json'),
          )
          .firstOrNull;

      return file;
    },
  );
}
