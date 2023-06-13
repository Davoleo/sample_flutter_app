//API access to Libraries
import 'dart:io';

main() {
  // === BUILT-IN TYPES ===
  //Numbers (int, double)
  //  num variables can be both int and double vars
  //  int|double.parse(string) to parse from string
  //
  //Strings (String)
  //String interpolation
  //Strings are introduced by double or single quotes "" or ''
  int n2 = 100;
  double d1 = 3.14;
  num y = 1.23;
  print("${y + n2} $d1");
  //Adjacent string literals are concatenated just like with the + operator in between
    var multiline = """example
  multiline
  string""";
    var rawString = r"escape codes don't work here \n\s\j\dead";
  //Booleans (bool)
  //Records ((value1, value2))
  //Lists (List, also known as arrays)
  //Sets (Set)
  //Maps (Map)
  //Runes (Runes; often replaced by the characters API)
  //Symbols (Symbol)
  //The value null (Null)

  // === RECORDS ===
  //anonymous, immutablem, aggregate type
  //Fixed-sized, heterogeneous, typed
  //Allow functions to return multiple values bundled and organized together
  // Coomma separated named or positional fields in ()
  (String, String, {int a, bool b}) record = ('first', a: 2, b: true, 'last');

  //Swaps record values
  (int, int) swap((int, int) record) {
    return (record.$2, record.$1);
  }

  //Records Equality: they're equal if they have the same set of fields and the all the fields have the same values

  //=== COLLECTIONS ===
  //Arrays are just lists that in some way behave like arrays
  var list = [
    'car',
    'boat',
    'plane', //Trailing comma not necessary but can help with copy-paste errors
  ];
  //compile constant list:
  var constant123 = const [1,2,3];

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
  Set<String> emptyConstantStringSet = const <String>{};
  Set<String> colors = {"yellow", "red"};
  colors.add("green");
  colors.add("green");
  print(colors);
  print(colors.runtimeType); //_CompactLinkedHashSet
  print(colors.last);

  //Maps | Sort of Associative Arrays
  //String: means that the key type is a String instance
  //dynamic: means that the value type is heterogeneous
  Map<String, dynamic> m = {"code": "dev", "description": "the one who codes"};
  print(m["code"]);
  m["efficiency"] = -1; // Adding entries

  //Spread operator (...) & null-aware spread operator (...?)
  var indexedby0 = [0, ...constant123]; //<-- Inserts all the value of one lists as separated values inside this one [could also be used for function params]

  //you can use if and for expressions inside lists
  var listOfStrings = ["#-1", for (var i in indexedby0) "#$i"];

  //=== GENERICS ===
  //They work like Java but there's no TYPE ERASURE
  //by default a generic T: "extends Object?"
  //you can enforce non-nullability by making it "extends Object"
  // or make it more specific for a certain Class: "extends Class"

  Consumer<String> stringgrabber = (str) => print(str);
  listOfStrings.forEach(stringgrabber);

  var numList = [1,2,3];
  //list pattern destructures three elements from numList;
  var [m1, m2, m3] = numList;

  var (a, b) = ('left', 'right');
  (b, a) = (a, b); // Swap.
  print('$a $b'); // Prints "right left".

  String color = "banana";
  var isPrimary = switch(color) {
    'red' || 'yellow' || 'blue' => true,
    _ => false
  };

}

//Relational Patterns
String asciiCharType(int char) {
  const space = 32;
  const zero = 48;
  const nine = 57;

  return switch (char) {
    < space => 'control',
    == space => 'space',
    > space && < zero => 'punctuation',
    >= zero && <= nine => 'digit',
    _ => ''
  };
}

//=== Typedefs ===
//Create easier type alias when types are complicated
typedef Consumer<T> = void Function(T value);

