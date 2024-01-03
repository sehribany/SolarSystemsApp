//
//  BaseViewModel.swift
//  SolarSystems
//
//  Created by Şehriban Yıldırım on 27.12.2023.
//

protocol BaseViewDataSource:AnyObject {}

protocol BaseViewEventSource:AnyObject {
    var showActivityIndicatorView: VoidClosure?   {get set}
    var hideActivityIndicatorView: VoidClosure?   {get set}
    var showLoading              : VoidClosure?   {get set}
    var hideLoading              : VoidClosure?   {get set}
    var showWarningToast         : StringClosure? {get set}
}

protocol BaseViewProtocol: BaseViewDataSource, BaseViewEventSource {}

class BaseViewModel<R: Router>: BaseViewProtocol {
    let router                   : R
    var showActivityIndicatorView: VoidClosure?
    var hideActivityIndicatorView: VoidClosure?
    var showLoading              : VoidClosure?
    var hideLoading              : VoidClosure?
    var showWarningToast         : StringClosure?
    
    init(router: R){
        self.router = router
    }
}
