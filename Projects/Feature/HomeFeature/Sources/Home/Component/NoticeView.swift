import DesignSystem
import SwiftUI

struct NoticeView: View {
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: "megaphone")
                .foregroundColor(.PrimaryVariant.primary)
                .padding(.leading, 24)
                .padding(.vertical, 12)

            Text("새로운 공지가 있습니다.")
                .dmsFont(.body(.body3), color: .GrayScale.gray6)

            Spacer()

            Image(systemName: "chevron.right")
                .resizable()
                .foregroundColor(.PrimaryVariant.primary)
                .frame(width: 7, height: 12)
                .padding(12)
                .background {
                    Color.PrimaryVariant.lighten2
                        .clipShape(Circle())
                }
                .padding(.trailing, 8)
        }
        .background {
            Color.System.surface
        }
        .cornerRadius(100)
        .padding(.horizontal, 24)
        .padding(.top, 12)
        .dmsShadow(style: .surface)
    }
}
