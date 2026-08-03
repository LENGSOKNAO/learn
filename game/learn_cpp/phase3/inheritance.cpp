#include <iostream>
#include <string>

class Entity {
public:
    std::string name;
    float x, y;

    Entity(const std::string& n) : name(n), x(0), y(0) {
        std::cout << "[Entity] " << name << " created\n";
    }

    virtual ~Entity() {
        std::cout << "[Entity] " << name << " destroyed\n";
    }

    void move(float dx, float dy) {
        x += dx;
        y += dy;
        std::cout << name << " moved to (" << x << ", " << y << ")\n";
    }

    virtual void describe() const {
        std::cout << "Entity: " << name << " at (" << x << ", " << y << ")\n";
    }
};

class Player : public Entity {
public:
    int health;
    int level;

    Player(const std::string& n) : Entity(n), health(100), level(1) {
        std::cout << "[Player] " << n << " leveled up to " << level << "\n";
    }

    void levelUp() {
        level++;
        std::cout << name << " leveled up to " << level << "!\n";
    }

    void describe() const override {
        std::cout << "Player: " << name << " (Lv" << level << ") HP=" << health << "\n";
    }
};

class Enemy : public Entity {
public:
    int damage;
    std::string enemyType;

    Enemy(const std::string& n, const std::string& type, int dmg)
        : Entity(n), damage(dmg), enemyType(type) {
        std::cout << "[Enemy] " << n << " is a " << type << "\n";
    }

    void describe() const override {
        std::cout << "Enemy: " << name << " (" << enemyType << ") DMG=" << damage << "\n";
    }
};

void run_phase3_inheritance() {
    std::cout << "--- 1. Inheritance Basics ---\n";
    std::cout << "Player and Enemy inherit from Entity (base class).\n";
    std::cout << "Derived classes get Entity's fields and methods.\n\n";

    std::cout << "--- 2. Creating Objects ---\n";
    Player hero("Arthur");
    Enemy goblin("Goblin1", "Goblin", 15);
    std::cout << "\n";

    std::cout << "--- 3. Using Inherited Members ---\n";
    std::cout << "hero.name = " << hero.name << " (inherited from Entity)\n";
    std::cout << "hero.x = " << hero.x << ", hero.y = " << hero.y << " (inherited)\n";
    std::cout << "hero.level = " << hero.level << " (Player-specific)\n";
    std::cout << "hero.damage = ??? (Player has no damage field)\n\n";

    std::cout << "--- 4. Calling Inherited Methods ---\n";
    hero.move(10, 5);
    std::cout << "\n";
    goblin.move(3, 2);
    std::cout << "\n";

    std::cout << "--- 5. Derived Class Methods ---\n";
    hero.levelUp();
    std::cout << "\n";

    std::cout << "--- 6. Virtual Functions & Polymorphism ---\n";
    Entity* entities[] = {&hero, &goblin};
    for (const auto* e : entities) {
        e->describe();
    }
    std::cout << "\n";

    std::cout << "--- 7. Single Inheritance ---\n";
    std::cout << "Player inherits from Entity (one base class).\n";
    std::cout << "This is single inheritance.\n\n";

    std::cout << "--- 8. Unreal Engine Class Hierarchy (concept) ---\n";
    std::cout << "AActor -> APawn -> ACharacter -> AMyCharacter\n";
    std::cout << "AActor -> AActorComponent -> UPrimitiveComponent\n";
    std::cout << "UObject -> UActorComponent -> UHealthComponent\n";
    std::cout << "In UE, almost everything derives from UObject or AActor.\n";
}