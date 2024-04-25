import DesignSystem
import SwiftUI

struct OutingApplyNoticeView: View {
    let notice: String

    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: "megaphone")
                .foregroundColor(.PrimaryVariant.primary)
                .padding(.top, 15)
                .padding(.bottom, 16)
                .padding(.leading, 19)

            Text(notice)
                .dmsFont(.body(.body3), color: .GrayScale.gray6)
                .padding(.trailing, 18)

            Spacer()
        }
        .background(Color.System.surface)
        .cornerRadius(100)
        .padding(.top, 11)
        .dmsShadow(style: .surface)
        .padding(.horizontal, 24)
    }
}
