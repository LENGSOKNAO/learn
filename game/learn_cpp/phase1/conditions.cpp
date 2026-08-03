#include <iostream>
#include <string>

void run_phase1_conditions() {
    std::cout << "--- if Statement ---\n";
    int score = 85;
    if (score >= 60) {
        std::cout << "You passed!\n";
    }
    std::cout << "\n";

    std::cout << "--- if / else Statement ---\n";
    int temperature = 35;
    if (temperature > 30) {
        std::cout << "It is hot outside!\n";
    } else {
        std::cout << "It is cool outside.\n";
    }
    std::cout << "\n";

    std::cout << "--- else if Statement ---\n";
    int grade = 75;
    if (grade >= 90) {
        std::cout << "Grade: A\n";
    } else if (grade >= 80) {
        std::cout << "Grade: B\n";
    } else if (grade >= 70) {
        std::cout << "Grade: C\n";
    } else if (grade >= 60) {
        std::cout << "Grade: D\n";
    } else {
        std::cout << "Grade: F\n";
    }
    std::cout << "\n";

    std::cout << "--- Nested if ---\n";
    int num = 15;
    if (num > 0) {
        std::cout << num << " is positive.\n";
        if (num % 2 == 0) {
            std::cout << num << " is also even.\n";
        } else {
            std::cout << num << " is odd.\n";
        }
    } else {
        std::cout << num << " is not positive.\n";
    }
    std::cout << "\n";

    std::cout << "--- switch Statement ---\n";
    int day = 3;
    switch (day) {
        case 1:
            std::cout << "Monday\n";
            break;
        case 2:
            std::cout << "Tuesday\n";
            break;
        case 3:
            std::cout << "Wednesday\n";
            break;
        case 4:
            std::cout << "Thursday\n";
            break;
        case 5:
            std::cout << "Friday\n";
            break;
        case 6:
            std::cout << "Saturday\n";
            break;
        case 7:
            std::cout << "Sunday\n";
            break;
        default:
            std::cout << "Invalid day\n";
            break;
    }
    std::cout << "\n";

    std::cout << "--- switch with char ---\n";
    char choice = 'B';
    switch (choice) {
        case 'A': std::cout << "You chose Attack\n"; break;
        case 'B': std::cout << "You chose Defend\n"; break;
        case 'C': std::cout << "You chose Heal\n"; break;
        default:  std::cout << "Unknown command\n"; break;
    }
    std::cout << "\n";

    std::cout << "--- switch fall-through (intentional) ---\n";
    int month = 2;
    switch (month) {
        case 1: case 3: case 5: case 7: case 8: case 10: case 12:
            std::cout << month << " has 31 days\n"; break;
        case 4: case 6: case 9: case 11:
            std::cout << month << " has 30 days\n"; break;
        case 2:
            std::cout << month << " has 28 or 29 days\n"; break;
        default:
            std::cout << "Invalid month\n"; break;
    }
}