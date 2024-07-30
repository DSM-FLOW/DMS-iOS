import DesignSystem
import MealDomainInterface
import SwiftUI
import UtilityModule

struct MealCarouselView: View {
    @StateObject var uiState = UIStateModel()
    var meal: MealEntity?
    var selectedDate: Date
    @Binding var isLoading: Bool
    let spacing: CGFloat = 30
    let widthOfHiddenCards: CGFloat = UIScreen.main.bounds.width / 2 * 0.15
    let breakfastSkeleton: [String] = .generateSkeletonDummy()
    let lunchSkeleton: [String] = .generateSkeletonDummy()
    let dinnerSkeleton: [String] = .generateSkeletonDummy()

    var body: some View {
        CarouselCanvas {
            Carousel(
                numberOfItems: 3,
                spacing: spacing,
                widthOfHiddenCards: widthOfHiddenCards
            ) {
                HStack(spacing: 30) {
                    if isLoading {
                        mealView(meal: breakfastSkeleton, mealType: .breakfast)
                        mealView(meal: lunchSkeleton, mealType: .lunch)
                        mealView(meal: dinnerSkeleton, mealType: .dinner)
                    } else if let meal {
                        mealView(meal: meal.breakfast, mealType: .breakfast)
                        mealView(meal: meal.lunch, mealType: .lunch)
                        mealView(meal: meal.dinner, mealType: .dinner)
                    } else {
                        mealView(meal: [], mealType: .breakfast)
                        mealView(meal: [], mealType: .lunch)
                        mealView(meal: [], mealType: .dinner)
                    }
                }
            }
            .environmentObject(uiState)
            .onChange(of: selectedDate) { _ in
                withAnimation {
                    self.uiState.activeCard = 0
                }
            }
        }
        .onAppear {
            let mealType = DisplayMealPart(date: Date()).rawValue % 4
            uiState.activeCard = mealType == 3 ? 0 : mealType
        }
    }

    @ViewBuilder
    func mealView(meal: [String], mealType: DisplayMealPart) -> some View {
        VStack(spacing: 8) {
            Image(systemName: mealType.systemName)
                .resizable()
                .foregroundColor(.GrayScale.gray9)
                .frame(width: 28, height: 28)
                .padding(.top, 16)
                .unredacted()

            VStack {
                if meal == [""] {
                    Text("급식이 없습니다.")
                        .dmsFont(.body(.body1), color: .GrayScale.gray6)
                        .frame(maxHeight: .infinity)
                } else {
                    ForEach(meal, id: \.self) { meal in
                        if !meal.hasSuffix("Kcal") {
                            Text(meal)
                                .dmsFont(.body(.body1), color: .GrayScale.gray6)
                                .frame(maxHeight: .infinity)
                        }
                    }
                }
            }
            .padding(.vertical, 12)
            .frame(maxHeight: .infinity)

            Text(meal.last?.hasSuffix("Kcal") ?? false ? meal.last ?? "0Kcal" : "0Kcal")
                .dmsFont(.body(.body2), color: .GrayScale.gray5)
                .padding(.bottom, 16)
        }
        .redacted(reason: isLoading ? .placeholder : [])
        .frame(
            width: UIScreen.main.bounds.width - (widthOfHiddenCards*2) - (spacing*2),
            height: uiState.activeCard == mealType.rawValue ?
                UIScreen.main.bounds.height * 0.4546 :
                UIScreen.main.bounds.height * 0.4103
        )
        .background {
            Color.System.surface
                .cornerRadius(20)
        }
        .overlay {
            RoundedRectangle(cornerRadius: 20)
                .stroke(
                    uiState.activeCard == mealType.rawValue ? Color.PrimaryVariant.primary : .clear,
                    lineWidth: 1
                )
        }
        .dmsShadow(style: .mealCarousel)
        .transition(.slide)
        .animation(.spring(), value: uiState.screenDrag)
    }
}
