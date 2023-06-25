import 'dart:convert';
import 'dart:io';
import 'dart:math';

final random = Random();
const oneSecond = Duration(seconds: 1);

//Async & Await are used like in JavaScript to avoid callback hell
Future<void> printWithDelay(String message, [Duration delay = oneSecond]) async {
  await Future.delayed(delay);
  print(message);
}

Future<String> fetchUserOrder() =>
  Future.delayed(const Duration(seconds: 4), () => random.nextBool() ? 'Large Latte' : throw 'Cannot locate user order');

Future<void> printOrderMessage() async {
  try {
    print('Awaiting user order...');
    var order = await fetchUserOrder();
    print('Your order is: $order');
  }
  catch (err) {
    print("Caught error: $err");
  }
}

void main() {
  countSeconds(4);
  printOrderMessage();

  //File stream example
  var config = File('README.md');
  Stream<List<int>> stream = config.openRead();
  stream.transform(utf8.decoder).transform(const LineSplitter()).listen((String line) {
    print('Got ${line.length} characters from stream');
  }, onDone: () => print('file complete, now closed...'), onError: (e) => print(e)
  );
}

//Counts seconds by creating s futures with incrementing delay
void countSeconds(int s) {
  for (var i = 1; i <= s; i++) {
    printWithDelay(i.toString(), Duration(seconds: i));
  }
}
