//YES! DART è FORTEMENTE TIPIZZATO

  //Anche le variabili primitive hanno metodi  e possono essere considerate degli oggetti istanze di classi
  //JUST LIKE KOTLIN
  import 'dart:io';

  main(List<String> args) {

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

  //No "Arrays"
  //Just lists that in some way behave like arrays

  //Fixed elements count lists ---
  List<int> fixed_int_list = new List.of([200]);
  print(fixed_int_list);

  var growable_string_list = new List.of(["Greetings"], growable: true);
  print(growable_string_list);

  //Variable element count lists
  var variable_int_list = [1, 2, 3]; //<--- This sets the initial values but keeps the list length variable
  variable_int_list.add(4);
  variable_int_list.removeAt(0);
  print(variable_int_list);

  var growable_int_list_2 = new List.empty(growable: true); //Growable list - No initial Values
  //var variable_int_list_2 = [];  <---  you can also do this ^^ this way
  growable_int_list_2.add(18);
  growable_int_list_2[0] = -91;
  print(growable_int_list_2);

  //Indexed for loop
  for(int i = 0; i < variable_int_list.length; i++) {
    stdout.write(variable_int_list[i].toString() + " ");
  }
  print("");

  //Iterators
  var iterator = variable_int_list.iterator;
  while(iterator.moveNext())
    stdout.write(iterator.current.toString() + " ");
  print("");

  // for in loop (implicit iterator)
  for(var el in variable_int_list)
    stdout.write("$el ");
  print("");

  //.forEach()
  variable_int_list.forEach((var el) => stdout.write("$el "));

  //Set elements have no order | The only order they keep is the one they are given when elements are added
  //Sets cannot have multiple identical elements
  Set<String> colors = {"yellow", "red"};
  colors.add("green");
  colors.add("green");
  print(colors);
  print(colors.runtimeType); //_CompactLinkedHashSet
  print(colors.last);

  //Maps | Sort of Associative Arrays
  Map m = {"code": "dev", "description": "the one who codes"};
  print(m["codice"]);
  m["efficiency"] = -1; // Adding entries

}



