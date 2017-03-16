import PlaygroundSupport
import UIKit

PlaygroundPage.current.needsIndefiniteExecution = true

class Model {


}

protocol AsynchronousCountable {
	func count(f: @escaping (Int) -> ())
}

extension Model: AsynchronousCountable {
	func count(f: @escaping (Int) -> Void) {
		DispatchQueue.main.async {
			f(0)
		}
	}
}

protocol CanBeEmpty : AsynchronousCountable {
	func whenEmpty(_ onTrue: @escaping () -> (), otherwise onFalse: @escaping () -> ())
}

extension Model: CanBeEmpty {
	func whenEmpty(_ onTrue: @escaping (Void) -> Void, otherwise onFalse: @escaping (Void) -> Void) {
		self.count { (count) in
			if count == 0 {
				onTrue()
			} else {
				onFalse()
			}
		}
	}
}

let model = Model()

model.whenEmpty({
	//no registers
}, otherwise: {
	//there are some registers
})