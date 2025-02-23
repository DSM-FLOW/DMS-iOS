import DesignSystem
import SwiftUI

struct OutingTextFieldView: View {
    var title: String
    var placeholder: String
    @Binding var text: String
    var isRequired: Bool?

    public init(
        _ title: String = "",
        _ placeholder: String = "",
        _ text: Binding<String>,
        _ isRequired: Bool? = false
    ) {
        self.title = title
        self.placeholder = placeholder
        _text = text
        self.isRequired = isRequired
    }

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(title)
                    .dmsFont(.body(.body2), color: .GrayScale.gray10)
                    .padding(.leading, 1)

                if isRequired ?? false {
                    Text("*")
                        .foregroundColor(.PrimaryVariant.primary)
                }
            }

            DMSFormTextField(placeholder, text: $text)
        }
    }
}
