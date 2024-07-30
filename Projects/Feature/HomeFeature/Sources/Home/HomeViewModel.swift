import BaseFeature
import Combine
import Foundation
import UtilityModule
import MealDomainInterface
import NoticeDomainInterface
import SwiftUI

final class HomeViewModel: BaseViewModel {
    @Published var isNavigateToAlarm: Bool = false
    @Published var selectedDate = Date()
    @Published var isExistNewNotice = false
    @Published var meals: [String: MealEntity] = [:]
    @Published var prevMonth = Date().month
    var selectedDateString: String {
        "\(selectedDate.customFormat("yyyy/MM/dd")) (\(selectedDate.dayOfWeek()))"
    }
    var selectedDateMeal: MealEntity {
        meals[selectedDate.toSmallDMSDateString()] ?? .init(
            date: selectedDate.toSmallDMSDateString(),
            breakfast: [],
            lunch: [],
            dinner: []
        )
    }

    private let fetchMealListUseCase: any FetchMealListUseCase
    private let fetchWhetherNewNoticeUseCase: any FetchWhetherNewNoticeUseCase

    init(
        fetchMealListUseCase: any FetchMealListUseCase,
        fetchWhetherNewNoticeUseCase: any FetchWhetherNewNoticeUseCase
    ) {
        self.fetchMealListUseCase = fetchMealListUseCase
        self.fetchWhetherNewNoticeUseCase = fetchWhetherNewNoticeUseCase
        super.init()
    }

    func onAppear() {
        if DisplayMealPart(date: Date()) == .nextDayBreakfast && Date().day == selectedDate.day {
            selectedDate = selectedDate.adding(by: .day, value: 1)
        }
        addCancellable(fetchWhetherNewNoticeUseCase.execute()) { [weak self] isExistNewNotice in
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                withAnimation {
                    self?.isExistNewNotice = isExistNewNotice
                }
            }
        }
    }

    func onChangeSelectedDate() {
        if self.prevMonth != selectedDate.month {
            self.fetchMealList()
        }
        self.prevMonth = selectedDate.month
    }

    func fetchMealList() {
        addCancellable(
            fetchMealListUseCase.execute(date: selectedDate.toSmallDMSDateString())
        ) { [weak self] meals in
            meals.forEach { meal in
                self?.meals[meal.date] = meal
            }
        }
    }
}
