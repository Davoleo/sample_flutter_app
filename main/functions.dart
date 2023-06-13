//Functions --------------------
// When nested into other function the have to be called after they're declaration

import 'dart:core';
import 'dart:math';

import 'dart-oop.dart';

//shorthand function [for one liners]
int double(int n) => n*2;

f()
{}

main()
{
  //primitive types are passed by value in functions
  int num = 100;
  double(num);
  print(num); //100

  var fun = f();
  print(fun == null);
  print(fun.runtimeType);

  generateButton("button_confirm", 32);
  //parameters can be assigned specifically addressing them by their name (only if they are enclosed in {})
  generateButtonNamed(id: "namedParamButton", colorCode: 123);

  var codes = ["ABC123", "XVW667", "GTU200", "MVQ003"];
  String prefixes=""; //<-- All the letters
  codes.forEach((String el) {prefixes += el.substring(0, 3);});
  print(prefixes);

  //Arrow functions | Anonymous Functions [LAMBDA]
  var powerFunctions = [(n) => n*n, (n) => n*n*n, (base, espo) => pow(base, espo)];
  print(powerFunctions[0](2));
  print(powerFunctions[1](2));
  print(powerFunctions[2](2, 5));

  var clients = [Client("Pellini", 12340, 23), Client("Rossi", 600, 100)];

  var criteriaSampleDouble = (Client a, Client b) => a.sampleDouble < b.sampleDouble;
  var criteriaSampleInt = (Client a, Client b) => a.sampleInt < b.sampleInt;

  sort(criteriaSampleDouble, clients);
  clients.forEach((ele) {print(ele.name);});

  sort( FunctionRepository.extract("sampleDouble"), clients);
  clients.forEach((ele) {print(ele.name);});

  //Can't access directly to the _releaseYear unless using the setter
  Anime killLaKill = Anime("Kill La Kill", 2014, 9.5);
  print(killLaKill.score);
  print(killLaKill.releaseYear);

}

// Generators
// Lazily produce sequence of values:
//- Synchronous: Iterable
//- Asynchronous: Stream
Iterable<int> naturalsTo(int n) sync* {
  int k = 0;
  while (k < n)
    yield k++;
}

Stream<int> asyncNaturalsTo(int n) async* {
  int k = 0;
  while (k < n)
    yield k++;
}

//yield* -> Better performance in recursive generators
Iterable<int> naturalsDownFrom(int n) sync* {
  if (n > 0) {
    yield n;
    yield* naturalsDownFrom(n);
  }
}

//NO FUNCTION OVERLOAD
//optional parameters are defined by enclosing them into [] - you can assign Default value to optional parameters
String generateButton(String id, [int colorCode = 0, int width=100])
{
  String html = "<button id='$id' style='color: $colorCode; width: $width' ></button>";
  return html;
}

//required: makes a named parameter "necessary"
String generateButtonNamed({ required String id, int colorCode = 0})
{
  String html = "<button id='$id' style='color: $colorCode'></button>";
  return html;
}

//Data Structure
class Client
{
  String name="";
  num sampleDouble=0;
  int sampleInt=0;

  Client(String name, num sampleDouble, int sampleInt)
  {
    this.name = name;
    this.sampleDouble = sampleDouble;
    this.sampleInt = sampleInt;
  }
}

/// Higher order functions
void sort(Function compare, List<Client> clients )
{
  Client temp;
  for (int i=0; i<clients.length - 1; i++)
    for (int j=i+1; j<clients.length; j++)
    {
      if (compare(clients[j], clients[i]))
      {
        temp = clients[i];
        clients[i]=clients[j];
        clients[j] = temp;
      }
    }
}

class FunctionRepository {

  static var functions = {"sampleDouble": (Client a, Client b) => a.sampleDouble < b.sampleDouble,
    "sampleInt": (Client a, Client b) => a.sampleInt < b.sampleInt};

  static Function extract(String criteria)
  {
    return functions[criteria]!;
  }
}