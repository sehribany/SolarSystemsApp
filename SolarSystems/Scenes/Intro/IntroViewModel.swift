//
//  IntroViewModel.swift
//  SolarSystems
//
//  Created by Şehriban Yıldırım on 27.12.2023.
//
import MobilliumUserDefaults

protocol IntroViewDataSource {
    func numberOfItemsAt(section: Int) -> Int
    func cellItemAt(indexPath: IndexPath) -> IntroCellProtocol
}

protocol IntroViewEventSource {}

protocol IntroViewProtocol: IntroViewDataSource, IntroViewEventSource {}

final class IntroViewModel: BaseViewModel<IntroRouter>, IntroViewProtocol{
    
    private var cellItems: [IntroCellProtocol] = [IntroCellModel(image: Asset.Images.introBackground1.image,
                                                                 titleText: L10n.Intro.firstTitle,
                                                                 descriptionText: L10n.Intro.fourthTitle),
                                                  IntroCellModel(image: Asset.Images.introBackground2.image,
                                                                 titleText: L10n.Intro.secondTitle,
                                                                 descriptionText: L10n.Intro.fourthTitle),
                                                  IntroCellModel(image: Asset.Images.introBackground3.image,
                                                                 titleText: L10n.Intro.thirdTitle, 
                                                                 descriptionText: L10n.Intro.fourthTitle)]
    
    func numberOfItemsAt(section: Int) -> Int {
        cellItems.count
    }
    
    func cellItemAt(indexPath: IndexPath) -> IntroCellProtocol {
        cellItems[indexPath.row]
    }
}

extension IntroViewModel {
    func finishedIntro() {
        DefaultsKey.isIntroCompleted.value = true
        router.presentMainTabBar()
    }
}
