import Foundation

func calcMul(_ expr: inout [String]) {
    while expr.contains("*") {
        let idx = expr.firstIndex(of: "*")!
        let prevNum = Int64(expr[idx - 1])!, nextNum = Int64(expr[idx + 1])!
        expr[idx] = String(prevNum * nextNum)
        expr.remove(at: expr.index(idx, offsetBy: -1))
        expr.remove(at: idx)
    }
}

func calcAdd(_ expr: inout [String]) {
    while expr.contains("+") {
        let idx = expr.firstIndex(of: "+")!
        let prevNum = Int64(expr[idx - 1])!, nextNum = Int64(expr[idx + 1])!
        expr[idx] = String(prevNum + nextNum)
        expr.remove(at: expr.index(idx, offsetBy: -1))
        expr.remove(at: idx)
    }
}

func calcSub(_ expr: inout [String]) {
    while expr.contains("-") {
        let idx = expr.firstIndex(of: "-")!
        let prevNum = Int64(expr[idx - 1])!, nextNum = Int64(expr[idx + 1])!
        expr[idx] = String(prevNum - nextNum)
        expr.remove(at: expr.index(idx, offsetBy: -1))
        expr.remove(at: idx)
    }
}

func solution(_ expression:String) -> Int64 {
    var prize: Int64 = 0
    let expr: [String] = expression.reduce(into: [String]()) { arr, c in
        if let _ = Int64(String(c)), let last = arr.last, let _ = Int64(last) {
            arr[arr.count - 1] += String(c)
        } else {
            arr.append(String(c))
        }
    }
    
    
    // - < + < *
    var copiedExpr = expr
    calcMul(&copiedExpr)
    calcAdd(&copiedExpr)
    calcSub(&copiedExpr)
    prize = max(abs(Int64(copiedExpr[0])!), prize)
    
    // - < * < +
    copiedExpr = expr
    calcAdd(&copiedExpr)
    calcMul(&copiedExpr)
    calcSub(&copiedExpr)
    prize = max(abs(Int64(copiedExpr[0])!), prize)
    
    // + < - < *
    copiedExpr = expr
    calcMul(&copiedExpr)
    calcSub(&copiedExpr)
    calcAdd(&copiedExpr)
    prize = max(abs(Int64(copiedExpr[0])!), prize)
    
    // + < * < -
    copiedExpr = expr
    calcSub(&copiedExpr)
    calcMul(&copiedExpr)
    calcAdd(&copiedExpr)
    prize = max(abs(Int64(copiedExpr[0])!), prize)
    
    // * < + < -
    copiedExpr = expr
    calcSub(&copiedExpr)
    calcAdd(&copiedExpr)
    calcMul(&copiedExpr)
    prize = max(abs(Int64(copiedExpr[0])!), prize)
    
    // * < - < +
    copiedExpr = expr
    calcAdd(&copiedExpr)
    calcSub(&copiedExpr)
    calcMul(&copiedExpr)
    prize = max(abs(Int64(copiedExpr[0])!), prize)
    
    return prize
}