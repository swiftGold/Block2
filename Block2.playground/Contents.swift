import Foundation

//Задание 2 - Определить две константы a и b типа Double, присвоить им любые значения. Вычислить среднее значение и сохранить результат в переменную avarage.
let a = 2.22
let b = 4.44
let avarage = (a + b) / 2


//Задание 3 - Создать кортеж, и задать два любых строковых значения с названиями firstName и lastName. Далее необходимо вывести в консоль строку в формате "Full name: [firstName] [lastName]".
let person = (firstName: "John", lastName: "Black")
func printPerson() {
  print("Full name: [\(person.firstName)] [\(person.lastName)]")
}
printPerson()


//Задание 4 - Создать две опциональные переменные типа Float. Одной из них задать первоначальное значение. Написать функцию, которая принимает на вход опциональную переменную типа Float. Функция должна безопасно извлечь значение из входящей переменной. Если значение удалось получить - необходимо вывести его в консоль, если значение у переменной отсутствует вывести в консоль фразу "Variable can't be unwrapped". Вызвать функцию дважды с двумя ранее созданными переменными.
var value1: Float? = 2.22
var value2: Float?

func fetchVariableValue(_ value: Float?) {
  // MARK: - Variant 1
  guard let value = value else {
    print("Variable can't be unwrapped")
    return
  }
  print(value)
  
  // MARK: - Variant 2
  //  if let value {
  //    print(value)
  //  } else {
  //    print("Variable can't be unwrapped")
  //  }
}

fetchVariableValue(value1)
fetchVariableValue(value2)


//Задание 5 - Напишите программу для вывода первых 15 чисел последовательности Фибоначчи
var startArray = [0, 1]

func fibonacciIntegers(_ intArray: [Int]) -> [Int] {
  var fibArray = intArray
  for i in 0..<13 {
    let newInt = fibArray[i] + fibArray[i + 1]
    fibArray.append(newInt)
  }
  return fibArray
}

print(fibonacciIntegers(startArray))


//Задание 6 - Напишите программу для сортировки массива, использующую метод пузырька. Сортировка должна происходить в отдельной функции, принимающей на вход исходный массив.
var startArray2 = [4, 3, 2, 1, 12, 56, 99, 8, 5, 7, 9]

func arraySorting(_ intArray: [Int]) -> [Int] {
  var sortedArray = intArray
  
  for i in 0..<sortedArray.count {
    let newLastIndex = (sortedArray.count - 1) - i
    
    for j in 0..<sortedArray.count {
      if j == sortedArray.count - 1 { break }
      let currentNumber = sortedArray[j]
      let nextIntegerIndex = j + 1
      if currentNumber > sortedArray[nextIntegerIndex] {
        sortedArray.remove(at: j)
        sortedArray.insert(currentNumber, at: nextIntegerIndex)
      }
    }
  }
  return sortedArray
}

print(arraySorting(startArray2))


//Задание 7 - Напишите программу, решающую задачу: есть входящая строка формата "abc123", где сначала идет любая последовательность букв, потом число. Необходимо получить новую строку, в конце которой будет число на единицу больше предыдущего, то есть "abc124".
let startString = "abc999"

func increaseStringLastInteger(_ string: String) -> String {
  let arrayFromString = string.map { String($0) }
  var newString = ""
  var integerString = ""
  var intValueFromString = 0
  
  for i in 0..<arrayFromString.count {
    let checkedValue = arrayFromString[i]
    if Int(checkedValue) != nil {
      integerString += checkedValue
    } else {
      newString += checkedValue
    }
  }
  
  if let intValue = Int(integerString) {
    intValueFromString = intValue + 1
  }
  
  newString += String(intValueFromString)
  return newString
}

print(increaseStringLastInteger(startString))
