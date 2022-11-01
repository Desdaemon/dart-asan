import 'dart:ffi';
import 'package:test/test.dart';

final dylib = DynamicLibrary.open(Uri.base.resolve('main').toFilePath());
final leak = dylib.lookupFunction<Void Function(), void Function()>('leak');
final doubleFree =
    dylib.lookupFunction<Void Function(), void Function()>('double_free');
final useAfterFree =
    dylib.lookupFunction<Void Function(), void Function()>('use_after_free');

void main() {
  test('leak', () {
    leak();
  });
  test('double-free', () {
    doubleFree();
  });
  test('use after free', () {
    useAfterFree();
  });
}
