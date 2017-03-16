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

func isEmpty(model: Model, onTrue: @escaping (Void) -> Void, onFalse: @escaping (Void) -> Void) {
	model.count { (count) in
		if count == 0 {
			onTrue()
		} else {
			onFalse()
		}
	}
}

let model = Model()

isEmpty(model: model, onTrue: {
	//no registers
}, onFalse: {
	//there are some registers
})