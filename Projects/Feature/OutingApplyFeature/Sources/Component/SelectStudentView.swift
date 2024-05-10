import DesignSystem
import StudentsDomainInterface
import SwiftUI

struct SelectStudentView: View {
    @StateObject var viewModel: OutingApplyViewModel
    @Binding var selectStudentsText: String
    @State var searchText = ""

    var body: some View {
        VStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 5)
                .strokeBorder(Color.GrayScale.gray5, lineWidth: 1)
                .frame(height: 50)
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundStyle(Color.GrayScale.gray10)
                            .frame(width: 24, height: 24)

                        TextField(
                            "학번 또는 이름을 검색하세요.",
                            text: $searchText,
                            onCommit: viewModel.searchStudentInfo
                        )
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
                    selectStudentViewCell(
                        studentInfo: studentInfo,
                        isSelected: viewModel.companionIdsApplication.contains(studentInfo.id.uuidString)
                    ) {
                        viewModel.insertSelectedStudent(
                            studentInfo: studentInfo,
                            name: studentInfo.name,
                            id: studentInfo.id.uuidString,
                            gradeClassNumber: studentInfo.gradeClassNumber
                        )
                    } removedAction: {
                        viewModel.deleteSelectedStudent(
                            studentInfo: studentInfo,
                            name: studentInfo.name,
                            gradeClassNumber: studentInfo.gradeClassNumber,
                            id: studentInfo.id.uuidString
                        )
                    }
                }
            }
            .padding(.top, 10)
            .padding(.horizontal, 24)

            Text("선택자 목록")
                .dmsFont(.etc(.caption), color: .black)
                .padding(.top, 20)
                .padding(.horizontal, 24)
            Spacer()

            ScrollView(showsIndicators: false) {
                ForEach(viewModel.selectStudent, id: \.self) { studentInfo in
                    selectStudentViewCell(
                        studentInfo: studentInfo,
                        isSelected: viewModel.companionIdsApplication.contains(studentInfo.id.uuidString)
                    ) {
                        viewModel.insertSelectedStudent(
                            studentInfo: studentInfo,
                            name: studentInfo.name,
                            id: studentInfo.id.uuidString,
                            gradeClassNumber: studentInfo.gradeClassNumber
                        )
                    } removedAction: {
                        viewModel.deleteSelectedStudent(
                            studentInfo: studentInfo,
                            name: studentInfo.name,
                            gradeClassNumber: studentInfo.gradeClassNumber,
                            id: studentInfo.id.uuidString
                        )
                    }
                }
            }
            .padding(.top, 8)
            .padding(.horizontal, 24)

            DMSWideButton(
                text: "\(viewModel.companionIdsApplication.count)명 선택",
                color: .PrimaryVariant.primary
            ) {
                selectStudentsText = viewModel.outingCompanionName
                viewModel.isShowingBottomSheet = false
            }
            .padding(.top, 24)
            .padding(.horizontal, 24)
        }
    }

    @ViewBuilder
    func selectStudentViewCell(
        studentInfo: StudentEntity,
        isSelected: Bool,
        selectedAction: @escaping () -> Void,
        removedAction: @escaping () -> Void
    ) -> some View {
        Button {
            (isSelected ? removedAction : selectedAction)()
        } label: {
            RoundedRectangle(cornerRadius: 8)
                .strokeBorder(isSelected ? .PrimaryVariant.primary : Color.GrayScale.gray3, lineWidth: 1)
                .frame(height: 64)
                .overlay(
                    HStack(spacing: 16) {
                        Circle()
                            .fill(Color.GrayScale.gray5)
                            .padding(.vertical, 12)
                            .padding(.leading, 16)

                        Text("\(studentInfo.gradeClassNumber) \(studentInfo.name)")
                            .dmsFont(.etc(.button), color: isSelected ? .PrimaryVariant.primary : .GrayScale.gray6)

                        Spacer()
                    }
                )
        }
    }
}
