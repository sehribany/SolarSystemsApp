//
//  BaseViewController.swift
//  SolarSystems
//
//  Created by Şehriban Yıldırım on 27.12.2023.
//

import UIKit

class BaseViewController<V: BaseViewProtocol>: UIViewController {

    var viewModel: V
    
    init(viewModel: V) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func subscribeToast() {
        viewModel.showWarningToast = { text in
            ToastPresenter.showWarningToast(text: text)
        }
    }
       
    func showWarningToast(message: String) {
        ToastPresenter.showWarningToast(text: message)
    }
}
