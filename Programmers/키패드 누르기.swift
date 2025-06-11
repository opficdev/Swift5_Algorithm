import Foundation

func solution(_ numbers:[Int], _ hand:String) -> String {
    var leftHandPos = 10, rightHandPos = 12
    var result = ""
    
    for num in numbers {
        if (num - 1) % 3 == 0 { //  1,4,7
            leftHandPos = num == 0 ? 11 : num
            result += "L"
        }
        else if 0 < num && num % 3 == 0 {  //  3,6,9
            rightHandPos = num == 0 ? 11 : num
            result += "R"
        }
        else {  //  그 외
            let num = num == 0 ? 11 : num
            let leftDistance = abs(leftHandPos - num) / 3 + abs(leftHandPos - num) % 3
            let rightDistance = abs(rightHandPos - num) / 3 + abs(rightHandPos - num) % 3
            
            if leftDistance < rightDistance {   //  왼손이 더 가까운거
                leftHandPos = num
                result += "L"
            }
            else if leftDistance > rightDistance {  //  오른손이 더 가까운거
                rightHandPos = num
                result += "R"
            }
            else {
                if hand == "left" { //  왼손잡이
                    leftHandPos = num
                    result += "L"
                }
                else {  //  오른손잡이
                    rightHandPos = num
                    result += "R"
                }
            }
        }
    }
    
    return result
}
