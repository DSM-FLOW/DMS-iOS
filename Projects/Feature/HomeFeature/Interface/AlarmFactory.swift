import SwiftUI

public protocol AlarmFactory {
    associatedtype SomeView: View
    func makeView() -> SomeView
}
