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
    
    private var cellItems: [IntroCellProtocol] = [IntroCellModel(image: Asset.Images.earth.image,
                                                                 titleText: L10n.Intro.Intro.firstTitle,
                                                                 descriptionText: L10n.Intro.Intro.fourthTitle),
                                                  IntroCellModel(image: Asset.Images.jupiter.image,
                                                                 titleText: L10n.Intro.Intro.secondTitle,
                                                                 descriptionText: L10n.Intro.Intro.fourthTitle),
                                                  IntroCellModel(image: Asset.Images.saturn.image,
                                                                 titleText: L10n.Intro.Intro.thirdTitle, 
                                                                 descriptionText: L10n.Intro.Intro.fourthTitle)]
    
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
