import 'dart:ffi';
import 'package:test/test.dart';

final dylib = DynamicLibrary.open(Uri.base.resolve('main').toFilePath());
final leak = dylib.lookupFunction<Void Function(), void Function()>('leak');

void main() {
  test('leak', () {
    leak();
  });
}
