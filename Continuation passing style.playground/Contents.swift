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

let model = Model()

model.count { (count) in
	if count == 0 {
		//no registers
	} else {
		//there are some registers
	}
}