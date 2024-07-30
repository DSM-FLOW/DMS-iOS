import Foundation

struct CalendarSheetModel: Equatable, Identifiable {
    let id: String = UUID().uuidString
    let date: Date
    let day: Int
}
