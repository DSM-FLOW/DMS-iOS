import DesignSystem
import SwiftUI

struct OutingApplyTextField: View {
    @State var title: String
    var placeholder: String
    @Binding var text: String
    var status: Bool?

    public init(
        _ title: String = "",
        _ placeholder: String = "",
        _ text: Binding<String>,
        _ status: Bool? = false
    ) {
        self.title = title
        self.placeholder = placeholder
        _text = text
        self.status = status
    }

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(title)
                    .dmsFont(.body(.body2), color: .GrayScale.gray10)
                    .padding(.leading, 1)
                    .padding(.bottom, 8)

                if self.status ?? false {
                    Text("*")
                        .dmsFont(.body(.body3), color: .PrimaryVariant.primary)
                }
            }

            DMSFormTextField(placeholder, text: $text)
        }
    }
}
