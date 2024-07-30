import BaseFeature
import DesignSystem
import SwiftUI
import UtilityModule
import HomeFeatureInterface

struct HomeView: View {
    @StateObject var viewModel: HomeViewModel
    @State var isShowingCalendar = false
    @Environment(\.tabbarHidden) var tabbarHidden
    @Environment(\.dmsSelectionTabbKey) var dmsSelectionTabbKey
    @EnvironmentObject var appState: AppState
    @State var isNavigateToAlarm = false

    private let alarmFactory: any AlarmFactory

    init(
        viewModel: HomeViewModel,
        alarmFactory: any AlarmFactory
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.alarmFactory = alarmFactory
    }

    var body: some View {
        GeometryReader { proxy in
            ZStack(alignment: .bottom) {
                VStack {
                    Spacer()

                    Rectangle()
                        .fill(
                            LinearGradient(
                                colors: [
                                    Color.GrayScale.gray1
                                        .opacity(0.03),
                                    Color.PrimaryVariant.primary
                                        .opacity(0.15)
                                ],
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        )
                        .frame(height: proxy.size.height * 0.5713)
                }
                .ignoresSafeArea()

                ScrollView(showsIndicators: false) {
                    VStack(alignment: .center) {
                        if viewModel.isExistNewNotice {
                            Button {
                                dmsSelectionTabbKey.wrappedValue = .notice
                            } label: {
                                NoticeView()
                            }
                            .animation(
                                .easeIn(duration: 1.5),
                                value: viewModel.isExistNewNotice
                            )
                        }

                        Text("오늘의 급식")
                            .dmsFont(.title(.title1), color: .GrayScale.gray7)
                            .padding(.top, viewModel.isExistNewNotice ? 10 : 46)

                        selectDateView()
                            .padding(.top, 15)

                        MealCarouselView(
                            meal: viewModel.selectedDateMeal,
                            selectedDate: viewModel.selectedDate,
                            isLoading: $viewModel.isLoading
                        )
                        .padding(.top, 36)

                        Spacer()
                    }
                }
            }
        }
        .onChange(of: viewModel.selectedDate) { _ in
            viewModel.onChangeSelectedDate()
        }
        .onAppear {
            viewModel.onAppear()
            viewModel.fetchMealList()
        }
        .onChange(of: isShowingCalendar) { newValue in
            tabbarHidden.wrappedValue = newValue
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                DMSImage(.logoHorizontal, renderingMode: .original)
                    .scaledToFit()
                    .frame(height: 28)
            }
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    print("벨 아이콘이 클릭되었습니다.")
                    isNavigateToAlarm.toggle()
                }, label: {
                    Image(systemName: "bell.fill")
                        .scaledToFit()
                        .frame(height: 28)
                        .foregroundColor(Color.GrayScale.gray5)
                })
            }
        }
        .dmsBackground()
        .dmsBottomSheet(
            isShowing: $isShowingCalendar,
            isGrabberOn: true,
            sheetCornerRadiusValue: 25
        ) {
            DeferView {
                CalendarSheetView(selectedDate: $viewModel.selectedDate)
                    .padding(.top, 24)
            }
        }
//        .onChange(of: viewModel.isNavigateToAlarm) { newValue in
//            withAnimation {
//                tabbarHidden.wrappedValue = newValue
//            }
//        }
        .navigate(
            to: alarmFactory.makeView().eraseToAnyView(),
            when: $isNavigateToAlarm
        )
        .environment(\.rootPresentationMode, $isNavigateToAlarm)
    }

    @ViewBuilder
    func selectDateView() -> some View {
        HStack(spacing: 12) {
            Button {
                viewModel.selectedDate = viewModel.selectedDate.adding(by: .day, value: -1)
            } label: {
                Image(systemName: "chevron.left")
                    .foregroundColor(.GrayScale.gray6)
            }

            Button {
                withAnimation {
                    isShowingCalendar.toggle()
                }
            } label: {
                Label {
                    Text(viewModel.selectedDateString)
                } icon: {
                    Image(systemName: "calendar")
                }
                .dmsFont(.etc(.button), color: .GrayScale.gray6)
                .padding(.vertical, 8.5)
                .padding(.horizontal, 12)
                .overlay {
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(Color.GrayScale.gray5, lineWidth: 1)
                }
            }

            Button {
                viewModel.selectedDate = viewModel.selectedDate.adding(by: .day, value: 1)
            } label: {
                Image(systemName: "chevron.right")
                    .foregroundColor(.GrayScale.gray6)
            }
        }
    }
}
