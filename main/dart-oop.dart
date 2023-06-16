//No destructors | Objects are automatically destroyed by ur friend the GC (Garbage Collector)

//Abstract classes are present and you can write abstract methods by just removing their body


class Anime
{
  //by default every field or method in a class are public
  //to make variables "package-private" you can put an underscore behind the name
  String name;
  int _releaseYear;
  double score;

  //Direct initialization [implicit assignment of internal fields]
  Anime(this.name, this._releaseYear, this.score);

  //Initializer list [usually used when you need to do extra stuff in intialization or initialization is not banal, see below]
  Anime.expanded(name, releaseYear, score) :
        this.name = name,
        this._releaseYear = releaseYear,
        this.score = score;

  //named constructor, initializer list
  Anime.fromJson(var jsonObj) :
        this.name = jsonObj["name"],
        this._releaseYear = jsonObj["releaseYear"],
        this.score = jsonObj["score"];

  //This calls the expanded constructor
  //Sole purpose of this constructor is to delegate the work to another one kekw
  Anime.fromJsonRedirect(var jsonObj) :
      this.expanded(jsonObj["name"], jsonObj["releaseYear"], jsonObj["score"]);

  //The only way you can access to private veriables from an external file
  int get releaseYear => _releaseYear;

  //Makes the object callable, can be called like a function
  //in this case it just returns the object itself
  Anime call() {
    return this;
  }

  @override
  bool operator ==(Object other) =>
      other is Anime
          && name == other.name
          && _releaseYear == other._releaseYear
          && score == other.score;

  set releaseYear(int value) {
    _releaseYear = value;
  }

  //you can override this method to intercept calls to non existent member methods
  //Avoiding the NoSuchMethodError that would be thrown otherwise
  @override
  dynamic noSuchMethod(Invocation invocation) {
    print("You tried to use a non-existent member: ${invocation.memberName}");
  }
}

class Person {
  final String name;

  static final Map<String, Person> _cache = <String, Person>{};

  //Factory constructors can return from cache instead of creating a new object or also work on creating subclasses instances.
  factory Person(String name) {
    return _cache.putIfAbsent(name, () => Person._internal(name));
  }

  factory Person.fromJson(Map<String, Object> json) {
    return Person(json['name'].toString());
  }

  Person._internal(this.name);

  void speak() {
    print("Hello, my name's $name");
  }
}

// Mixins can be added to classes to add functionality [traits]
class Programmer extends Person with CoffeeDrinker {

  String language;

  Programmer(String name, this.language) : super._internal(name);
  
  @override
  void speak() {
    print("Hello my name is $name and I code in $language");
  }
}

//Mixins are like traits in other oop languages, allow to add new features to generic objects
mixin CoffeeDrinker {
  int drunkCoffees = 0;
  
  void drinkCoffee() {
    drunkCoffees++;
    print("Drinking coffee n°$drunkCoffees...");
  }
}

//Interfaces don't exist
//Every class can be implicitly used as an interface, implementing it's methods
abstract class Animal {
  void makeNoise();
}

class Bird implements Animal {
  @override
  void makeNoise() {
    print("Tweet Tweet");
  }
}

enum PlanetType {
  terrestrial,
  gaseous,
  ice
}

enum Planet {
  mercury(type: PlanetType.terrestrial, moons: 0, hasRings: false),
  venus(type: PlanetType.terrestrial, moons: 0, hasRings: false),
  //...
  uranus(type: PlanetType.ice, moons: 27, hasRings: true),
  neptune(type: PlanetType.ice, moons: 14, hasRings: true);

  final PlanetType type;
  final int moons;
  final bool hasRings;

  //Constant contructors create objects that never change, these objects can be used as compile-time constants
  const Planet({required this.type, required this.moons, required this.hasRings});

  bool get isGiant => this.type == PlanetType.gaseous || this.type == PlanetType.ice;

}

//Extension methods
//Way to implant methods to external types [whether it's external library or primitive types]
//!You need to be careful! you can do some cool stuff but also very weird stuff that ruins APIs
extension StringExt on String {
  int parseInt() {
    return int.parse(this);
  }
  double parseDouble() {
    return double.parse(this);
  }
}

main() {
  Anime parasyte = Anime("Parasyte", 2014, 8.0);
  print(parasyte._releaseYear);
  var alias = parasyte();
  print(alias.name);

  Person uwu = Person("Matteo");
  Programmer davoleo = Programmer("Davoleo", "Java");
  uwu.speak();
  davoleo.speak();

  int answer = '42'.parseInt();
}

