
protocol AdvancedLiveSupport {
    func performCPR()
}

class EmergencyCallHandler {
    var delegate: AdvancedLiveSupport?
    
    func emergency() {
        delegate?.performCPR()
    }
}

struct Paramedic: AdvancedLiveSupport {
    init(handler: EmergencyCallHandler) {
        handler.delegate = self
    }
    
    func performCPR() {
        print("Execute CPR")
    }
}

class Nurse: AdvancedLiveSupport {
    init(handler: EmergencyCallHandler) {
        handler.delegate = self
    }
    
    func performCPR() {
        print("Execute CPR")
    }
}

class Doctor: Nurse {
    override func performCPR() {
        super.performCPR()
        print("Medicate the pacient")
    }
}

let operador = EmergencyCallHandler()
let paramedico = Paramedic(handler: operador)
let medico = Doctor(handler: operador)

operador.emergency()
