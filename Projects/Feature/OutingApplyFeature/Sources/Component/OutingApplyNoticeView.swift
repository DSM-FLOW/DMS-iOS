import DesignSystem
import SwiftUI

struct OutingApplyNoticeView: View {
    let notice: String

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: "megaphone")
                .foregroundColor(.PrimaryVariant.primary)
                .padding(.top, 15)
                .padding(.bottom, 16)
                .padding(.leading, 20)

            Text(notice)
                .dmsFont(.body(.body3), color: .GrayScale.gray6)
                .padding(.leading, 16)
                .padding(.trailing, 24)

            Spacer()
        }
        .background(Color.System.surface)
        .cornerRadius(100)
        .padding(.bottom, 8)
        .padding(.horizontal, 24)
        .dmsShadow(style: .surface)
    }
}
