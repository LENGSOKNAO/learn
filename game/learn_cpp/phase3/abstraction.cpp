#include <iostream>
#include <string>
#include <vector>

void run_phase3_classes();
void run_phase3_inheritance();
void run_phase3_polymorphism();

class Drawable {
public:
    virtual void draw() const = 0;
    virtual ~Drawable() = default;
};

class Renderable : public Drawable {
public:
    std::string meshName;

    Renderable(const std::string& mesh) : meshName(mesh) {}

    void draw() const override {
        std::cout << "Rendering mesh: " << meshName << "\n";
    }
};

class UIElement : public Drawable {
public:
    std::string text;

    UIElement(const std::string& t) : text(t) {}

    void draw() const override {
        std::cout << "Drawing UI text: \"" << text << "\"\n";
    }
};

class ParticleSystem : public Drawable {
public:
    int particleCount;

    ParticleSystem(int count) : particleCount(count) {}

    void draw() const override {
        std::cout << "Rendering " << particleCount << " particles\n";
    }
};

// Abstract base class for game entities
class GameObject {
public:
    std::string tag;

    GameObject(const std::string& t) : tag(t) {}
    virtual ~GameObject() = default;

    virtual void update(float deltaTime) = 0;
    virtual void onCollision(GameObject* other) = 0;

    void logTag() const {
        std::cout << "GameObject tag: " << tag << "\n";
    }
};

class Bullet : public GameObject {
public:
    float speed;

    Bullet(float spd) : GameObject("Bullet"), speed(spd) {}

    void update(float deltaTime) override {
        std::cout << "Bullet moving at " << speed << " units/sec\n";
    }

    void onCollision(GameObject* other) override {
        std::cout << "Bullet hit " << other->tag << "! Destroying...\n";
    }
};

void run_phase3_abstraction() {
    std::cout << "--- 1. Abstract Class ---\n";
    std::cout << "An abstract class has at least one pure virtual function (marked = 0).\n";
    std::cout << "You cannot instantiate an abstract class directly.\n\n";

    std::cout << "--- 2. Pure Virtual Function ---\n";
    std::cout << "virtual void draw() const = 0;\n";
    std::cout << " forces derived classes to provide an implementation.\n\n";

    std::cout << "--- 3. Interfaces (using abstract classes) ---\n";
    std::cout << "In C++, interfaces are abstract classes with all pure virtual functions.\n";
    std::cout << "Drawable acts as an interface for anything renderable.\n\n";

    std::cout << "--- 4. Using Interface Pointer ---\n";
    std::vector<Drawable*> renderables = {
        new Renderable("HeroMesh"),
        new UIElement("Score: 1000"),
        new ParticleSystem(500)
    };

    for (const auto* r : renderables) {
        r->draw();
    }
    std::cout << "\n";

    std::cout << "--- 5. Abstract Class for Game Objects ---\n";
    GameObject* bullet = new Bullet(500.0f);
    bullet->logTag();
    bullet->update(0.016f);
    GameObject* target = new Bullet(0);
    target->tag = "Enemy";
    bullet->onCollision(target);
    std::cout << "\n";

    std::cout << "--- Cleanup ---\n";
    for (auto* r : renderables) delete r;
    delete bullet;
    delete target;

    std::cout << "\n";
    std::cout << "--- 6. Why Abstraction Matters in UE ---\n";
    std::cout << "AActor is abstract. You never create an AActor directly.\n";
    std::cout << "You create APawn, ACharacter, AAnimal, etc.\n";
    std::cout << "Interfaces like ITargetable define shared behavior\n";
    std::cout << "across unrelated classes (e.g., Player and Enemy can both be targetable).\n";
}

void run_phase3() {
    run_phase3_classes();
    run_phase3_inheritance();
    run_phase3_polymorphism();
    run_phase3_abstraction();
}