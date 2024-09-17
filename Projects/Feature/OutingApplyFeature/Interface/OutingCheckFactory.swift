import SwiftUI

public protocol OutingCheckFactory {
    associatedtype SomeView: View
    func makeView() -> SomeView
}
