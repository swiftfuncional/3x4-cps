import PlaygroundSupport
import UIKit

PlaygroundPage.current.needsIndefiniteExecution = true

class Model {

	func count(f: @escaping (Int) -> Void) {
		DispatchQueue.main.async {
			f(0)
		}
	}
}

func whenEmpty(model: Model, _ onTrue: @escaping (Void) -> Void, otherwise onFalse: @escaping (Void) -> Void) {
	model.count { (count) in
		if count == 0 {
			onTrue()
		} else {
			onFalse()
		}
	}
}

let model = Model()

whenEmpty(model: model, {
	//no registers
}, otherwise: {
	//there are some registers
})