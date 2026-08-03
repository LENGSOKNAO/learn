#include <iostream>
#include <string>
#include <vector>

class Shape {
public:
    std::string name;

    Shape(const std::string& n) : name(n) {}
    virtual ~Shape() = default;

    virtual double area() const = 0;
    virtual void draw() const {
        std::cout << "Drawing a " << name << "\n";
    }
};

class Circle : public Shape {
public:
    double radius;

    Circle(double r) : Shape("Circle"), radius(r) {}

    double area() const override {
        return 3.14159265358979 * radius * radius;
    }
};

class Rectangle : public Shape {
public:
    double width, height;

    Rectangle(double w, double h) : Shape("Rectangle"), width(w), height(h) {}

    double area() const override {
        return width * height;
    }
};

class Triangle : public Shape {
public:
    double base, height;

    Triangle(double b, double h) : Shape("Triangle"), base(b), height(h) {}

    double area() const override {
        return 0.5 * base * height;
    }
};

void run_phase3_polymorphism() {
    std::cout << "--- 1. Function Overloading (compile-time polymorphism) ---\n";
    std::cout << "Same function name, different parameter types/signature.\n";
    std::cout << "The compiler picks the right one at compile time.\n\n";

    std::cout << "--- 2. Function Overriding (runtime polymorphism) ---\n";
    std::cout << "Derived class redefines a virtual function from the base.\n";
    std::cout << "The correct version is called based on the actual object type.\n\n";

    std::cout << "--- 3. Virtual Functions ---\n";
    std::cout << "The 'virtual' keyword enables runtime dispatch.\n";
    std::cout << "Without it, the base version would always be called.\n\n";

    std::cout << "--- 4. override Keyword ---\n";
    std::cout << "The 'override' keyword ensures you are actually overriding\n";
    std::cout << "a base class virtual function (catches typos and mismatches).\n\n";

    std::cout << "--- 5. Polymorphism in Action ---\n";
    std::vector<Shape*> shapes = {
        new Circle(5.0),
        new Rectangle(4.0, 6.0),
        new Triangle(3.0, 8.0)
    };

    std::cout << "Iterating over shapes (base pointer to derived objects):\n";
    for (const auto* shape : shapes) {
        shape->draw();
        std::cout << "  Area = " << shape->area() << "\n\n";
    }

    std::cout << "--- Cleanup ---\n";
    for (auto* shape : shapes) {
        delete shape;
    }
    std::cout << "\n";

    std::cout << "--- 6. Why this matters in Unreal Engine ---\n";
    std::cout << "AActor* myActor = new AMyEnemy();\n";
    std::cout << "myActor->Tick() calls the enemy's Tick(), not Actor's.\n";
    std::cout << "This is how UE handles all actor types uniformly.\n";
}