import Foundation

func solution(_ arr: [Int]) -> [Int] {
    var dict: [Int: Int] = [:], answer: [Int] = []
    arr.forEach { value in
        dict[value, default: 0] += 1
    }
    
    for key in dict.keys.sorted() {
        if 1 < dict[key]! {
            answer.append(dict[key]!)
        }
    }

    return answer.isEmpty ? [-1] : answer
}
