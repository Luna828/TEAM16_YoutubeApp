//
//  Valid Email Password +.swift
//  YoutubeCloneApp
//
//  Created by t2023-m0050 on 2023/09/05.
//

import Foundation

// 비밀번호 정규 표현식
extension String {
    // 대소문자, 특수문자, 숫자 8자 이상일 때 -> true
    func isValidPassword() -> Bool {
        let regularExpression = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[$@$!%*?&])[A-Za-z\\d$@$!%*?&]{8,}"
        let passwordValidation = NSPredicate(format: "SELF MATCHES %@", regularExpression)
        
        return passwordValidation.evaluate(with: self)
    }
    
    // @와2글자 이상 확인 1@naver.com
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        
        return emailTest.evaluate(with: self)
    }
    
    //YouTube 동영상
    func getVideoID() -> String? {
        // 정규식 패턴
        let pattern = #"\/vi\/([A-Za-z0-9_-]+)\/"# // YouTube 동영상 ID를 추출하는 패턴
        if let range = range(of: pattern, options: .regularExpression) {
            let videoID = self[range].replacingOccurrences(of: "/vi/", with: "").replacingOccurrences(of: "/", with: "")
            return videoID
        } else {
            print("YouTube Video ID를 찾을 수 없습니다.")
            return nil
        }
    }
}
