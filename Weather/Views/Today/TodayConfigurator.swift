import Foundation

class TodayConfigurator {
    
    public static func setupTodayModule() -> TodayViewController {
        let todayVC = TodayViewController()
        let presenter = TodayPresenter()
        let interactor = TodayInteractor()
        
        presenter.interactor = interactor
        presenter.view = todayVC
        todayVC.presenter = presenter
        
        return todayVC
    }
}
