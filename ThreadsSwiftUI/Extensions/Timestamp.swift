//
//  Timestamp.swift
//  ThreadsSwiftUI
//
//  Created by パクギョンソク on 2023/10/07.
//

import Foundation
import Firebase

extension Timestamp {
    func timestampString() -> String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.second, .minute, .hour, .day, .weekOfMonth]
        formatter.maximumUnitCount = 1 // 時間の単位は1つに絞る (例：1h 30mではなく、1h)
        formatter.unitsStyle = .abbreviated // 表示スタイル例） 1h or 30m とか
        return formatter.string(from: self.dateValue(), to: Date()) ?? ""
    }
}
