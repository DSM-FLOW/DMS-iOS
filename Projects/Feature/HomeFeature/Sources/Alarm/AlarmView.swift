import BaseFeature
import DesignSystem
import SwiftUI
import UtilityModule

struct AlarmView: View {
    @StateObject var viewModel: AlarmViewModel
    @Environment(\.tabbarHidden) var tabbarHidden
    @Environment(\.dmsSelectionTabbKey) var dmsSelectionTabbKey
//    @EnvironmentObject var appState: AppState

    init(viewModel: AlarmViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        Text("안녕하세요")
            .onAppear {
                viewModel.onAppear()
            }
    }
}
