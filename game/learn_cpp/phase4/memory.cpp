#include <iostream>
#include <string>
#include <cmath>

void run_phase4_modern();

class Entity {
public:
    std::string name;
    int health;

    Entity(const std::string& n, int h) : name(n), health(h) {
        std::cout << "[Entity] " << name << " created on the stack\n";
    }

    ~Entity() {
        std::cout << "[Entity] " << name << " destroyed\n";
    }

    void show() const {
        std::cout << name << " HP: " << health << "\n";
    }
};

void run_phase4_memory() {
    std::cout << "--- 1. Stack Memory ---\n";
    std::cout << "Stack memory is automatic and fast.\n";
    std::cout << "Variables on the stack are destroyed when they go out of scope.\n";
    {
        Entity e("StackEntity", 100);
        e.show();
    }
    std::cout << "Entity is now destroyed (out of scope).\n\n";

    std::cout << "--- 2. Heap Memory ---\n";
    std::cout << "Heap memory is manually managed (new/delete).\n";
    std::cout << "Objects on the heap persist until explicitly deleted.\n";
    Entity* heapEntity = new Entity("HeapEntity", 80);
    heapEntity->show();
    std::cout << "\n";

    std::cout << "--- 3. Pointers ---\n";
    int value = 42;
    int* ptr = &value;
    std::cout << "value = " << value << "\n";
    std::cout << "ptr = " << ptr << " (address of value)\n";
    std::cout << "*ptr = " << *ptr << " (dereferencing)\n";
    std::cout << "&value = " << &value << " (address-of operator)\n\n";

    std::cout << "--- 4. Pointer arithmetic ---\n";
    int arr[] = {10, 20, 30};
    int* p = arr;
    std::cout << "p[0] = " << p[0] << "\n";
    std::cout << "p[1] = " << p[1] << "\n";
    std::cout << "p[2] = " << p[2] << "\n";
    p++;
    std::cout << "After p++, *p = " << *p << "\n\n";

    std::cout << "--- 5. References ---\n";
    int a = 5;
    int& ref = a;
    ref = 10;
    std::cout << "a = " << a << " (changed via reference)\n";
    std::cout << "ref = " << ref << "\n";
    std::cout << "References must be initialized, cannot be reassigned.\n";

    const std::string& constRef = "hello";
    std::cout << "const reference: " << constRef << "\n\n";

    std::cout << "--- 6. nullptr ---\n";
    int* nullPtr = nullptr;
    std::cout << "nullPtr = " << (nullPtr ? "not null" : "null") << "\n";
    std::cout << "Always initialize pointers. Use nullptr in modern C++.\n\n";

    std::cout << "--- 7. new / delete ---\n";
    int* heapInt = new int(99);
    std::cout << "*heapInt = " << *heapInt << "\n";
    delete heapInt;
    heapInt = nullptr;
    std::cout << "Heap int deleted and pointer set to nullptr.\n";

    int* heapArray = new int[5]{1, 2, 3, 4, 5};
    std::cout << "Heap array elements: ";
    for (int i = 0; i < 5; ++i) {
        std::cout << heapArray[i] << " ";
    }
    std::cout << "\n";
    delete[] heapArray;
    heapArray = nullptr;
    std::cout << "Heap array deleted with delete[].\n\n";

    std::cout << "--- 8. Stack vs Heap summary ---\n";
    std::cout << "Stack: fast, automatic cleanup, limited size, local scope\n";
    std::cout << "Heap: slower, manual cleanup, large capacity, persists until deleted\n";

    delete heapEntity;
}

void run_phase4() {
    run_phase4_memory();
    run_phase4_modern();
}