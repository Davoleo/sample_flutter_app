
const oneSecond = Duration(seconds: 1);

//Async & Await are used like in JavaScript to avoid callback hell
Future<void> printWithDelay(String message) async {
  await Future.delayed(oneSecond);
  print(message);
}