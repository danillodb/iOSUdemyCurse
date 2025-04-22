import UIKit

//var greeting = "Hello, playground"
//print(greeting)
//print("Test 2+5 = \(2+5)")


let alphabet = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]

let pass: String = alphabet[Int.random(in: 0..<26)] + alphabet[Int.random(in: 0..<26)] + alphabet[Int.random(in: 0..<26)] + alphabet[Int.random(in: 0..<26)] + alphabet[Int.random(in: 0..<26)]

print(pass)

let res = Double(3) / 4
print(res)

let res2 = 1200 / 100
print(res2)

extension UIButton {
    func makeCircle() {
        self.layer.cornerRadius = self.frame.height / 2
        self.clipsToBounds = true
    }
}

let button: UIButton = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
button.backgroundColor = .blue
button.makeCircle()

func fibonacci(n: Int) {
    //Write your code here.
    var fibonacci = [0, 1]
    for number in 2..<n {
        let aux1 = fibonacci[fibonacci.count - 1]
        let aux2 = fibonacci[fibonacci.count - 2]
        fibonacci.append(aux1 + aux2)
    }
    print(fibonacci)
}

fibonacci(n: 5)
fibonacci(n: 10)
