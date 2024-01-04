//
//  IntroViewController.swift
//  SolarSystems
//
//  Created by Şehriban Yıldırım on 27.12.2023.
//

import UIKit

final class IntroViewController: BaseViewController<IntroViewModel> {
        
    private let backGround: UIImageView = {
        let imageView         = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let pageControl:UIPageControl = {
        let pageControl                           = UIPageControl()
        pageControl.pageIndicatorTintColor        = Asset.Colors.appYellow1.color.withAlphaComponent(0.5)
        pageControl.currentPageIndicatorTintColor = Asset.Colors.appYellow2.color
        pageControl.numberOfPages                 = 3
        return pageControl
    }()
    
    private let nextButton: UIButton = {
        let button                = UIButton(type: .system)
        let gradientLayer         = CAGradientLayer()
        gradientLayer.colors      = [Asset.Colors.appYellow1.color.cgColor, Asset.Colors.appYellow2.color.cgColor]
        let view                  = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width - 180, height: 45))
        gradientLayer.frame       = view.frame
        button.layer.cornerRadius = 17
        button.clipsToBounds      = true
        button.layer.insertSublayer(gradientLayer, at: 0)
        button.titleLabel?.font   = UIFont.font(.robotoBold, size: .xxLarge)
        button.setTitleColor(Asset.Colors.appWhite.color, for: .normal)
        button.addGestureRecognizer(UILongPressGestureRecognizer(target: IntroViewController.self, action:  #selector(tappedLongGesture)))
        return button
    }()
    
    private let buttonIcon: UIImageView = {
        let icon   = UIImageView()
        icon.image = Asset.Icons.icRocket.image
        return icon
    }()
        
    private var collectionView: UICollectionView = {
        let layout                     = UICollectionViewFlowLayout()
        layout.scrollDirection         = .horizontal
        let collectionView             = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.isPagingEnabled = true
        collectionView.backgroundColor = .clear
        collectionView.register(IntroCell.self, forCellWithReuseIdentifier: IntroCell.identifier)
        collectionView.showsVerticalScrollIndicator   = false
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contentConfigure()
        addSubViews()
    }
}
// MARK: -UILayout
extension IntroViewController{
    private func addSubViews(){
        addBackGround()
        addNextButton()
        addButtonIcon()
        addPageControl()
        addCollectionView()
    }
    
    private func addBackGround(){
        view.addSubview(backGround)
        backGround.image = Asset.Images.introBackground.image
        backGround.edgesToSuperview()
    }
    
    private func addNextButton() {
        view.addSubview(nextButton)
        nextButton.bottomToSuperview(usingSafeArea: true)
        nextButton.trailingToSuperview().constant = -90
        nextButton.leadingToSuperview().constant  = 90
        nextButton.height(45)
    }
    
    private func addButtonIcon(){
        nextButton.addSubview(buttonIcon)
        buttonIcon.centerYToSuperview()
        buttonIcon.trailingToSuperview().constant = -20
        buttonIcon.widthAnchor.constraint(equalToConstant: 25).isActive  = true
        buttonIcon.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
    }
    
    private func addCollectionView() {
        view.addSubview(collectionView)
        collectionView.top(to: view).constant                = 100
        collectionView.leadingToSuperview().constant         = 25
        collectionView.trailingToSuperview().constant        = -25
        collectionView.bottomToTop(of: pageControl).constant = -50
    }
    
    private func addPageControl() {
        view.addSubview(pageControl)
        pageControl.centerXToSuperview()
        pageControl.bottomToSuperview(usingSafeArea: true).constant = -70
    }
}

// MARK: -Configure
extension IntroViewController{
    private func contentConfigure(){
        collectionView.delegate              = self
        collectionView.dataSource            = self
        pageControl.isUserInteractionEnabled = false
        nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        nextButton.setTitle(L10n.Intro.next, for: .normal)
        let longPressGesture                 = UILongPressGestureRecognizer(target: self, action: #selector(tappedLongGesture(_:)))
        nextButton.addGestureRecognizer(longPressGesture)
    }
}

// MARK: -UICollectionViewDataSource
extension IntroViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.numberOfItemsAt(section: section)
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: IntroCell.identifier, for: indexPath) as? IntroCell else {fatalError("Could not dequeu IntroCell")}
        let cellItem   = viewModel.cellItemAt(indexPath: indexPath)
        cell.set(viewModel: cellItem)
        return cell
    }
}

// MARK: -Actions
extension IntroViewController {
    
    @objc func tappedLongGesture(_ gesture: UILongPressGestureRecognizer) {
            guard let view = gesture.view else { return }
            if gesture.state == .began {
                UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                UIView.animate(withDuration: 0.2, animations: {
                    view.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
                })
            } else if gesture.state == .ended {
                UIView.animate(withDuration: 0.2, animations: {
                    self.nextButton.transform = .identity
                })
            }
    }
    
    @objc
    private func nextButtonTapped() {
        if pageControl.currentPage == viewModel.numberOfItemsAt(section: 0) - 1 {
            viewModel.finishedIntro()
        } else {
            pageControl.currentPage += 1
            let indexPath = IndexPath(item: pageControl.currentPage, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            UIView.animate(withDuration: 0.3, animations: {
                self.backGround.transform = CGAffineTransform(translationX: 0, y: 5)
            }) { _ in
                UIView.animate(withDuration: 0.3) {
                self.backGround.transform = .identity
                }
            }
        }
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension IntroViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.frame.size
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        pageControl.currentPage = Int(scrollView.contentOffset.x / width)
        
        if pageControl.currentPage == viewModel.numberOfItemsAt(section: 0) - 1 {
            nextButton.setTitle(L10n.Intro.start, for: .normal)
        } else {
            nextButton.setTitle(L10n.Intro.next, for: .normal)
        }
    }
 }
