import 'dart:io';

void main() {
  final dir = Directory('./lib/src/');
  var ls = dir.list(recursive: true);
  print(ls);
  ls.forEach((e) {
    if (e.path.contains('.dart') && e.path.contains('model')) {
      print(e);
    }
  });
}
