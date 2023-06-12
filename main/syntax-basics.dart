//import behind a prefix [to avoid possible conflicts between two imported files]
//  "deferred as" can be used to lazily load a library, in case its contents are only used rarely or to decrease web app initial startup
//  deferrede library will be loaded on "await hello.loadLibrary()"
import 'dart-oop.dart' as oop;

//Top / Class-Level variables can't be lazily initialized unless they are "late"
//This brings the nullability problem to runtime if the variable is not initialized yet
// if this statement below had an initializer it would be called lazily [only on the first use of globalvar]
late int globalvar;

class todo {
  final String who;
  final String what;

  const todo(this.who, this.what);
}

main(List<String> args) {

  //Dart: Hello World
  print("Hello World!");

  //=== VARIABLES ===

  int? n1; //nullable value: initialized with null value
  int n2 = 100; //non-nullable value: forced initialization
  double d1 = 3.14;

  //general class for numbers
  num x = 100, y = 1.23;
  print(x+y);

  //Implicit Type Declaration [Type inference from assignment value]
  var n = 5.28;

  //Lazily initialize and use globalVar
  globalvar = 0;
  print(globalvar);

  //null is the only instance of the Null class that represents a null object
  var nullVar = null;

  //final variables can only be set once
  final finalInt = 0;
  //finalInt = 1;  Error

  //const variable is a compile-time constant [const is also implicitly final]
  // a const variable is also immutable!
  const constantName = "test";
  //const constantName = "test".toUpperCase(); Error

  //=== OPERATORS ===
  // / =>  Division
  // ~/ => Integer Division [discard remainder]
  // % => Remainder of Integer Division [modulo]


  Object person = oop.Person("name");

  //is operator: accessing specific fields
  if (person is oop.Person) {
    person.name;
  }

  //as operator: Typecast
  (person as oop.Person).name;

  var nil = null;
  person ??= nil;
  //^ only assigned if nil != null

  //Ternary Operator Expression:
  assert(person is oop.Person ? person.name.isNotEmpty : false);
  //Null verificated conditional expression
  assert(nil ?? person is oop.Person);
  //^ verify nil is true, if nil is null then check if person is of class Person

  //Cascade notation: Allows making a sequence of chained operations on an object
  // Uses: .. instead of . for chaining the various operations
  // ?.. is a null-shorting version of cascade, guarantees that operations are not performed on a null object

  //Other operators:
  //?[] : conditional array access, if the array is null return null otherwise access the index.
  //?. : conditional member access [classes]
  //!  : null assertion operator -> Casts a nullable type to its non-nullable variant [null errors are transported to runtime]

  //=== COMMENTS ===
  //Single-line comment

  ///Documentation Comment [also multi-line]
  ///
  /// bruh bruh brhu

  /*
  * Another style of Multi-line comments
  */

  //=== METADATA ===
  //Usually via annotations
  //Default annotations: @deprecated & @override
  
  //Custom Metadata annotations:
  @todo("davoleo", "do something")
  void doSomething() {
    print("B.O.B! DO SOMETHING!!");
  }

  //String type has methods (Just like Java)
  String s = "ciao".toUpperCase();
  bool result = true;

  //The superclass of everything is "Object" (Just like Java)

}



