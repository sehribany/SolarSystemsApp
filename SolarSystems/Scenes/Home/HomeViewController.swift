//
//  HomeViewController.swift
//  SolarSystems
//
//  Created by Şehriban Yıldırım on 4.01.2024.
//

import Segmentio

final class HomeViewController: BaseViewController<HomeViewModel> {
    
    private let segmentView        = Segmentio()
    private let pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
    
    private lazy var subViewControllers: [UIViewController] = {
        return self.preparedViewControllers()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: false)
        addSubViews()
        configureContents()
    }
}

// MARK: - UILayout
extension HomeViewController {
    private func addSubViews() {
        addPageViewController()
        addSegmentView()
    }
    
    private func addSegmentView() {
        view.addSubview(segmentView)
        segmentView.height(45)
        segmentView.layer.cornerRadius  = 15
        segmentView.layer.borderWidth   = 0.8
        segmentView.layer.borderColor   = Asset.Colors.appGray.color.cgColor
        segmentView.layer.masksToBounds = true
        segmentView.edgesToSuperview(excluding: .bottom, insets: UIEdgeInsets(top: 45, left: 12, bottom: 0, right: 12), usingSafeArea: false)
    }
    
    private func addPageViewController() {
        addChild(pageViewController)
        view.addSubview(pageViewController.view)
        pageViewController.view.edgesToSuperview()
        pageViewController.didMove(toParent: self)
    }
}
// MARK: - Configure and Set Localize
extension HomeViewController {
    private func configureContents() {
        segmentView.setup(content: [SegmentioItem(title: viewModel.segmentedControlTitles[0], image: nil),
                                    SegmentioItem(title: viewModel.segmentedControlTitles[1], image: nil),
                                    SegmentioItem(title: viewModel.segmentedControlTitles[2], image: nil)], style: .onlyLabel, options: .options() )
        segmentView.selectedSegmentioIndex = viewModel.selectedSegmentIndex
        definesPresentationContext = true
        addChild(pageViewController)
        pageViewController.didMove(toParent: self)
        pageViewController.delegate   = self
        pageViewController.dataSource = self
        pageViewController.setViewControllers([subViewControllers[viewModel.selectedSegmentIndex]],
                                              direction: .forward,
                                              animated: true,
                                              completion: nil)
        setSegmentHandler()
    }
}

// MARK: - Helper
extension HomeViewController {
    private func preparedViewControllers() -> [UIViewController] {
        let planetRouter            = PlanetRouter()
        let planetViewModel         = PlanetViewModel(router: planetRouter)
        let planetViewController    = PlanetViewController(viewModel: planetViewModel)
        planetRouter.viewController = planetViewController
        
        let dwarfPlanetRouter            = DwarfPlanetRouter()
        let dwarfPlanetViewModel         = DwarfPlanetViewModel(router: dwarfPlanetRouter)
        let dwarfPlanetViewController    = DwarfPlanetViewController(viewModel: dwarfPlanetViewModel)
        dwarfPlanetRouter.viewController = dwarfPlanetViewController
        
        let celestialBodiesRouter            = CelestialBodiesRouter()
        let celestialBodiesViewModel         = CelestialBodiesViewModel(router: celestialBodiesRouter)
        let celestialBodiesViewController    = CelestialBodiesViewController(viewModel: celestialBodiesViewModel)
        celestialBodiesRouter.viewController = celestialBodiesViewController
        
        return [
            planetViewController,
            dwarfPlanetViewController,
            celestialBodiesViewController
        ]
    }
    
    private func setSegmentHandler() {
        segmentView.valueDidChange = { [weak self] _, segmentIndex in
            guard let self = self else { return }
            var direction: UIPageViewController.NavigationDirection = .forward
            if segmentIndex < self.viewModel.selectedSegmentIndex {
                direction = .reverse
            }
            self.pageViewController.setViewControllers([self.subViewControllers[segmentIndex]], direction: direction, animated: true, completion: nil)
            self.viewModel.selectedSegmentIndex = segmentIndex
        }
    }
}

// MARK: - UIPageViewController
extension HomeViewController: UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return subViewControllers.count
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let currentIndex = subViewControllers.firstIndex(of: viewController) ?? 0
        if currentIndex <= 0 {
            return nil
        }
        return subViewControllers[currentIndex - 1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let currentIndex = subViewControllers.firstIndex(of: viewController) ?? 0
        if currentIndex >= subViewControllers.count - 1 {
            return nil
        }
        return subViewControllers[currentIndex + 1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            didFinishAnimating finished: Bool,
                            previousViewControllers: [UIViewController],
                            transitionCompleted completed: Bool) {
        if completed {
            if let currentViewController = pageViewController.viewControllers?.first,
               let index = subViewControllers.firstIndex(of: currentViewController) {
                segmentView.selectedSegmentioIndex = index
            }
        }
    }
}
