bool EvenorOdd(int num){
  return num % 2 == 0;
}

double getCircleArea(int radius){
  const pi = 3.14;
  return pi * radius * radius;
}

class Car{
  String make;
  String model;
  int year;

  Car(this.make, this.model, this.year);

  void display(){
    print("Car Make : $make \nCar Model : $model \nCar Year : $year");
  }

}

class Student{
  String _name;
  int _age;

  Student(this._name, this._age);

  set name(String value) => _name = value;

  set age(int value) => _age = value;

  String get name => _name;

  int get age => _age;

  void display(){
    print("Student Name : $_name \nStudent Age: $_age");
  }

}

class Vehicle{
  void move(){
    print("Vehicle is Moving");
  }
}

class Bicycle extends Vehicle{
  @override
  void move(){
    print("Bicycle is Moving");
  }
}

void main(){
  // -------------------------------------------------------------------
  // Exercise 1
  String name = "Abdur Rehman";
  int age = 20;
  List<String> favouriteColors = ["Red", "Green", "Blue", "Orange"];
  // -------------------------------------------------------------------
  // Exercise 2
  int num = 1;
  bool result = EvenorOdd(num);
  if (result) {
    print("$num is Even");
  } else {
    print("$num is Odd");
  }
  // -------------------------------------------------------------------
  // Exercise 3
  int radius = 20;
  double area = getCircleArea(radius);
  print("The area of the circle with radius $radius is $area");
  // -------------------------------------------------------------------
  // Exercise 4
  Car car = Car('Toyota', 'Corolla', 2021);
  car.display();
  // -------------------------------------------------------------------
  // Exercise 5
  Student s1 = Student("Abdur Rehman", 20);
  s1.display();
  s1.name = "Ali";
  print("Student Name : ${s1.name}");
  s1.age = 10;
  print("Student Age : ${s1.age}");
  // -------------------------------------------------------------------
  // Exercise 6
  Bicycle b1 = Bicycle();
  b1.move();

}
