import SwiftUI

public extension View {
    func dmsActionSheet<Actions: View>(
        isPresented: Binding<Bool>,
        @ViewBuilder actions: @escaping () -> Actions
    ) -> some View {
        modifier(DMSActionSheet(isPresented: isPresented, actions: actions))
    }
}
struct DMSActionSheet<Actions: View>: ViewModifier {
    @Binding var isPresented: Bool
    @ViewBuilder let actions: () -> Actions

    func body(content: Content) -> some View {
        ZStack {
            content
                .frame(maxWidth: .infinity, maxHeight: .infinity)

            ZStack(alignment: .bottom) {
                if isPresented {
                    Color.GrayScale.gray9.opacity(0.16)
                        .ignoresSafeArea()
                        .onTapGesture {
                            isPresented = false
                        }
                        .transition(.opacity)
                }

                if isPresented {
                    VStack {
                        GroupBox {
                            actions()
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }

                        GroupBox {
                            Button(role: .cancel) {
                                isPresented = false
                            } label: {
                                Text("취소")
                                    .frame(width: UIScreen.main.bounds.width - 48, alignment: .center)
                            }
                            .foregroundColor(.GrayScale.gray6)
                        }
                    }
                    .font(.title3)
                    .padding(8)
                    .transition(.move(edge: .bottom))
                }
            }
        }
        .animation(.easeInOut, value: isPresented)
   }
}
