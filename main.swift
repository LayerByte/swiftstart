import Foundation

enum DemoError: Error {
    case invalidScore
}

enum LearningLevel {
    case beginner
    case intermediate
    case advanced
}

struct Student {
    let name: String
    var score: Int

    func summary() -> String {
        return "\(name) scored \(score) points"
    }
}

class Course {
    let title: String
    var students: [Student]

    init(title: String, students: [Student]) {
        self.title = title
        self.students = students
    }

    func printRoster() {
        print("Course: \(title)")

        for student in students {
            print("- \(student.summary())")
        }
    }
}

// --- Prints a clean section title.
func printSection(_ title: String) {
    print("\n--- \(title) ---")
}

// --- Demonstrates constants, variables, and basic data types.
func demoBasicTypes() {
    printSection("Constants, Variables, and Basic Types")

    let appName = "SwiftStart"
    var lessonNumber = 1
    let age: Int = 16
    let price: Double = 19.99
    let isLearningSwift: Bool = true
    let message: String = "Welcome to Swift fundamentals"

    print("Constant String: \(appName)")
    print("Variable Int before update: \(lessonNumber)")
    lessonNumber += 1
    print("Variable Int after update: \(lessonNumber)")
    print("Integer: \(age)")
    print("Double: \(price)")
    print("Boolean: \(isLearningSwift)")
    print("String: \(message)")
}

// --- Demonstrates arrays, sets, and dictionaries.
func demoCollections() {
    printSection("Arrays, Sets, and Dictionaries")

    let languages = ["Swift", "Python", "C++"]
    let uniqueNumbers: Set<Int> = [1, 2, 2, 3, 4]
    let profile = [
        "name": "Ava",
        "level": "Beginner",
        "favorite": "Swift"
    ]

    print("Array:")
    for language in languages {
        print("- \(language)")
    }

    print("\nSet removes duplicates:")
    print(uniqueNumbers.sorted())

    print("\nDictionary:")
    for (key, value) in profile {
        print("\(key): \(value)")
    }
}

// --- Demonstrates if statements and switch.
func demoConditions() {
    printSection("If Statements and Switch")

    let score = 86

    if score >= 90 {
        print("Grade: Excellent")
    } else if score >= 70 {
        print("Grade: Good")
    } else {
        print("Grade: Keep practicing")
    }

    let level = LearningLevel.beginner

    switch level {
    case .beginner:
        print("Level: Start with the basics")
    case .intermediate:
        print("Level: Practice with small projects")
    case .advanced:
        print("Level: Build larger applications")
    }
}

// --- Demonstrates for loops and while loops.
func demoLoops() {
    printSection("For Loops and While Loops")

    print("For loop:")
    for number in 1...5 {
        print("Number \(number)")
    }

    print("\nWhile loop:")
    var countdown = 3

    while countdown > 0 {
        print("\(countdown)...")
        countdown -= 1
    }

    print("Done!")
}

// --- Demonstrates functions, tuples, and optionals.
func demoFunctionsOptionalsAndTuples() {
    printSection("Functions, Optionals, and Tuples")

    func greet(name: String) -> String {
        return "Hello, \(name)!"
    }

    func findStudent(id: Int) -> String? {
        if id == 1 {
            return "Mia"
        }

        return nil
    }

    func calculateStats(values: [Int]) -> (total: Int, average: Double) {
        let total = values.reduce(0, +)
        let average = Double(total) / Double(values.count)
        return (total, average)
    }

    print(greet(name: "Student"))

    let optionalStudent = findStudent(id: 1)

    if let student = optionalStudent {
        print("Optional found a student: \(student)")
    } else {
        print("No student found")
    }

    let stats = calculateStats(values: [80, 90, 75])
    print("Tuple total: \(stats.total)")
    print("Tuple average: \(stats.average)")
}

// --- Demonstrates enums, structs, classes, and basic OOP.
func demoTypesAndOOP() {
    printSection("Enums, Structs, Classes, and OOP")

    let studentOne = Student(name: "Ava", score: 92)
    let studentTwo = Student(name: "Noah", score: 84)
    let course = Course(title: "Swift Basics", students: [studentOne, studentTwo])

    course.printRoster()
}

// --- Demonstrates closures.
func demoClosures() {
    printSection("Closures")

    let numbers = [5, 2, 9, 1, 7]
    let sortedNumbers = numbers.sorted { first, second in
        return first < second
    }

    let doubledNumbers = numbers.map { number in
        return number * 2
    }

    print("Original numbers: \(numbers)")
    print("Sorted with closure: \(sortedNumbers)")
    print("Doubled with closure: \(doubledNumbers)")
}

// --- Demonstrates throwing and catching errors.
func demoErrorHandling() {
    printSection("Basic Error Handling")

    func validateScore(_ score: Int) throws {
        if score < 0 || score > 100 {
            throw DemoError.invalidScore
        }
    }

    do {
        let score = 105
        try validateScore(score)
        print("Score is valid: \(score)")
    } catch DemoError.invalidScore {
        print("Error: score must be between 0 and 100")
    } catch {
        print("Unexpected error: \(error)")
    }
}

func printBanner() {
    print("============================================================")
    print("SwiftStart")
    print("Swift fundamentals in one beginner-friendly application.")
    print("School Purpose Only.")
    print("============================================================")
}

func main() {
    printBanner()
    demoBasicTypes()
    demoCollections()
    demoConditions()
    demoLoops()
    demoFunctionsOptionalsAndTuples()
    demoTypesAndOOP()
    demoClosures()
    demoErrorHandling()
}

main()
