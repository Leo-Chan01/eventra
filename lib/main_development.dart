import 'package:eventra/app/app.dart';
import 'package:eventra/bootstrap.dart';

Future<void> main() async {
  await bootstrap(() => const App());
}
