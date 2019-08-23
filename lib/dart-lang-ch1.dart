//YES! DART è FORTEMENTE TIPIZZATO

main(List<String> args) {
  //Anche le variabili primitive hanno metodi  e possono essere considerate degli oggetti istanze di classi
  //JUST LIKE KOTLIN

  //Dart: Hello World
  print("Hello World!");

  int n1; //initialized with null value (just like java)
  int n2 = 100;
  double d1 = 3.14;

  //general class for numbers
  num x = 100, y = 1.23;
  print(x+y);

  //general variable for everything | Implicit Type Declaration
  var n = 5.28;

  //String interpolation (JUST LIKE KOTLIN)
  //Strings are introduced by double or single quotes "" or ''
  print("${y + n2} $d1");

  //String type has methods (Just like Java)
  String s = "ciao".toUpperCase();
  bool result = true;

  //The superclass of everything is "Object" (Just like Java)

  //null is the only instance of the Null class that represents a null object
  var nullVar = null;


}



