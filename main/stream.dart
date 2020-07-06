
import 'dart:async';

main() async {
  Duration deltaT = Duration(seconds: 2);

  //Has an input and output and is async
  Stream<int> stream = Stream.periodic(deltaT, callback);

  //the stream outputs 5 values and then stops
  stream = stream.take(5);
  //the stream outputs values while the condition is true
  stream = stream.takeWhile((int value) => value <= 10);
  //More useful methods:
  //skip(), skipWhile()
  //you can filter / group / modify / insert elements / buffer a stream

  await for(int i in stream) {
    print(i);
  }

  //Fills a list with all the stream elements async
  //List<int> list = await stream.toList();

  //Creates a second stream with all the values that are compatible with the boolean condition
  stream = stream.where((int event) => true);

  //The stream is created inside the controller
  //A broadcast controller doesn't care if the listening of the stream items is not complete and can support multiple different subscriptions while the regular controller does
  final StreamController controller = StreamController();

  final StreamSubscription subscription = controller.stream.listen((data) => print("$data"));

  controller.sink.add("name surname");
  controller.sink.add(1234);
  controller.sink.add({'a': 'first element', 'b': 'second element'});

  controller.close();

  final StreamController<int> broadcastController = StreamController.broadcast();

  final StreamSubscription bSubscription = broadcastController.stream
      .where((value) => value % 2 == 0)
      .listen((data) => print("$data")
  );

  for (int i = 1; i <= 10; i++) {
    broadcastController.sink.add(i);
  }

  broadcastController.close();
}

int callback(int value) {
  return (value + 1) * 2;
}