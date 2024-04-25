import DesignSystem
import SwiftUI

struct SelectStudentView: View {
    @StateObject var viewModel: OutingApplyViewModel
    @Binding var selectStudentsText: String
    @State private var selected = 0
    @State var searchText = ""

    var body: some View {
        VStack {
                RoundedRectangle(cornerRadius: 5)
                    .strokeBorder(Color.GrayScale.gray5, lineWidth: 1)
                    .frame(height: 50)
                    .overlay(
                        HStack {
                            Image(systemName: "magnifyingglass")
                                .foregroundStyle(Color.GrayScale.gray10)
                                .frame(width: 24, height: 24)

                            TextField("학번 또는 이름을 검색하세요.", text: $searchText, onCommit: {
                                viewModel.searchStudentInfo()
                            })
                            .dmsFont(.body(.body2), color: .GrayScale.gray10)
                            .onChange(of: searchText) { newValue in
                                viewModel.studentName = newValue
                            }
                        }
                        .padding(.horizontal, 12)
                    )
                    .padding(.horizontal, 24)

            ScrollView(showsIndicators: false) {
                ForEach(viewModel.students, id: \.self) { studentInfo in
                    SelectStudentViewCell(
                        viewModel: viewModel,
                        studentName: studentInfo.name,
                        gradeClassNumber: studentInfo.gradeClassNumber,
                        profileImageURL: studentInfo.profileImageURL,
                        studentId: studentInfo.id.uuidString,
                        selected: $selected
                    )
                }
            }
            .padding(.top, 16)
            .padding(.horizontal, 24)

            DMSWideButton(text: "\(selected)명 선택", color: .PrimaryVariant.primary, action: {
                selectStudentsText = viewModel.outingApplicationCompanionName
            })
            .padding(.top, 24)
            .padding(.horizontal, 24)
        }
        .onAppear {
            viewModel.outingCompanionIdsApplication = []
            viewModel.outingCompanionName = []
        }
    }
}

struct SelectStudentViewCell: View {
    @StateObject var viewModel: OutingApplyViewModel
    @State var studentName: String
    @State var gradeClassNumber: String
    @State var profileImageURL: URL
    @State var studentId: String
    @Binding var selected: Int
    @State private var isPressed = false

    var body: some View {
        Button {
            if !isPressed {
                selected += 1
                viewModel.outingCompanionIdsApplication.append(studentId)
                viewModel.outingCompanionName.append(studentName)
            } else {
                selected -= 1
                viewModel.outingCompanionName.removeLast()
            }
            isPressed.toggle()
        } label: {
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 8)
                    .strokeBorder(isPressed ? .PrimaryVariant.primary : Color.GrayScale.gray3, lineWidth: 1)

                HStack(spacing: 16) {
                    Circle()
                        .fill(Color.GrayScale.gray5)
                        .padding(.vertical, 12)
                        .padding(.leading, 16)

                    Text("\(gradeClassNumber) \(studentName)")
                        .dmsFont(.etc(.button), color: isPressed ? .PrimaryVariant.primary : .GrayScale.gray6)

                    Spacer()
                }
            }
            .frame(height: 64)
        }
    }
}
