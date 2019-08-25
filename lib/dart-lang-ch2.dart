//Functions --------------------
// When nested into other function the have to be called after they're declaration

import 'dart:core';
import 'dart:math';

int double(int n)
{
  return n*2;
}

f()
{}

main()
{
  //primitive types are passed as values in functions
  int num = 100;
  print(double(num));

  var fun = f();
  print(fun == null);
  print(fun.runtimeType);

  generateButton("button_confirm", 32);
  //parameters can be assigned specifically addressing them by their name (only if they are enclosed in {})
  generateButtonNominale(id: "namedParamButton", colorCode: 123);

  var codes = ["ABC123", "XVW667", "GTU200", "MVQ003"];
  String prefixes=""; //<-- All the letters

  codes.forEach((String el) {prefixes += el.substring(0, 3);});
  print(prefixes);

  //Arrow functions | Functions assigned to a variable (lists too)
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

}

//NO FUNCTION OVERLOAD
//optional parameters are defined by enclosing them into [] - you can assign Default value to optional parameters
String generateButton(String id, [int colorCode, int width=100])
{
  String html = "<button>";
  return html;
}

//the  @required annotation makes a parameter when using {} necessary
String generateButtonNominale({ /*@required*/ String id, int colorCode})
{
  String html = "<button>";
  return html;
}

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
    return functions[criteria];
  }
}