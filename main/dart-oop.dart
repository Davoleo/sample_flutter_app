//No destructors | Objects are automatically destroyed by ur friend the GC (Garbage Collector)

//Abstract classes are present and you can write abstract methods by just removing their body


class Anime
{
  //by default every field or method in a class are public
  //to make variables "package-private" you can put an underscore behind the name
  String name;
  int _releaseYear;
  double score;

  Anime(this.name, this._releaseYear, this.score);

  Anime.expanded(name, releaseYear, score)
  {
    this.name = name;
    this.releaseYear = releaseYear;
    this.score = score;
  }

  //Specific Constructors (special overload)
  Anime.fromJson(var jsonObj)
  {
    this.name = jsonObj["name"];
    this.releaseYear = jsonObj["releaseYear"];
    this.score = jsonObj["score"];
  }

  //This calls the expanded constructor
  Anime.fromJsonRedirect(var jsonObj) :
      this.expanded(jsonObj["name"], jsonObj["releaseYear"], jsonObj["score"]);

  //The only way you can access to private veriables from an external file
  int get releaseYear => _releaseYear;

  set releaseYear(int value) {
    _releaseYear = value;
  }

}

class Person {
  String name;

  Person(this.name);

  void speak() {
    print("Hello, my name's $name");
  }
}

class Programmer extends Person {

  String language;

  Programmer(String name, this.language) : super(name);
  
  @override
  void speak() {
    print("Hello my name is $name and I code in $language");
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

main() {
  Anime parasyte = Anime("Parasyte", 2014, 8.0);
  print(parasyte._releaseYear);

  Person uwu = Person("Matteo");
  Programmer davoleo = Programmer("Davoleo", "Java");
  uwu.speak();
  davoleo.speak();
}

