import Foundation

enum Type: String, CaseIterable {
    case BOOL, SHORT, FLOAT, INT, LONG
    
    var count: Int {
        switch self {
        case .BOOL:  return 1
        case .SHORT: return 2
        case .FLOAT: return 4
        case .INT:   return 8
        case .LONG:  return 16
        }
    }
}

func solution(_ param0: [String]) -> String {
    var memory: [String] = [], newMemory = "", lastType: Type? = nil
    for (idx, typeStr) in param0.enumerated() {
        let type = Type(rawValue: typeStr)!
        if let lastType = lastType {
            if lastType.count < 8 {
                newMemory += String(repeating: ".", count: (8 - newMemory.count) % type.count)
            }
            newMemory += String(repeating: "#", count: type.count)
        }
        else {
            newMemory = String(repeating: "#", count: type.count)
        }
        
        lastType = type
        
        if idx == param0.count - 1 && newMemory.count % 8 != 0 {
            newMemory += String(repeating: ".", count: 8 - newMemory.count % 8)
        }
        
        if newMemory.isEmpty || 8 <= newMemory.count {
            let arr = Array(newMemory).map { String($0) }
            for i in 0..<(arr.count / 8) {
                let str: String
                if arr.count <= (i + 1) * 8 {
                    str = arr[(i * 8)...].joined()
                }
                else {
                    str = arr[(i * 8)..<((i + 1) * 8)].joined()
                }
                memory.append(str)
            }
            newMemory = ""
        }
    }
    
    if  128 < memory.joined().count {
        return "HALT"
    }
    return memory.joined(separator: ",")
}

print(solution(["INT", "INT", "BOOL", "SHORT", "LONG"]))
print(solution(["INT", "SHORT", "FLOAT", "INT","BOOL"]))
print(solution(["FLOAT", "SHORT", "BOOL", "BOOL", "BOOL", "INT"]))
print(solution(["BOOL", "LONG", "SHORT", "LONG", "BOOL", "LONG", "BOOL", "LONG", "SHORT", "LONG", "LONG"]))