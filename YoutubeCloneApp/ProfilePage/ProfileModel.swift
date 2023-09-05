//
//  ProfileModel.swift
//  YoutubeCloneApp
//
//  Created by t2023-m0048 on 2023/09/04.
//

import Foundation
import UIKit

struct ProfileModel {
    var icon: UIImage
    var title: String
}


var list = [ProfileModel(icon: UIImage(systemName: "person.crop.square")!, title: "내 채널"),
            ProfileModel(icon: UIImage(systemName: "eye.slash")!, title: "시크릿 모드 사용"),
            ProfileModel(icon: UIImage(systemName: "p.square.fill")!, title: "내 premium 혜택"),
            ProfileModel(icon: UIImage(systemName: "dollarsign.circle")!, title: "구매 항목 및 멤버쉽"),
            ProfileModel(icon: UIImage(systemName: "chart.bar.fill")!, title: "시청 시간"),
            ProfileModel(icon: UIImage(systemName: "bolt.shield")!, title: "YouTube의 내 데이터"),
            ProfileModel(icon: UIImage(systemName: "gearshape")!, title: "설정"),
            ProfileModel(icon: UIImage(systemName: "questionmark.circle")!, title: "고객센터"),
            ProfileModel(icon: UIImage(systemName: "play.rectangle.fill")!, title: "Youtube 스튜디오"),
            ProfileModel(icon: UIImage(systemName: "music.mic.circle.fill")!, title: "Youtube Music")]

