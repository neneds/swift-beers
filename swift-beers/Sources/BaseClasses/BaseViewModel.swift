//
//  BaseViewModel.swift
//
//  Created by Dennis Merli on 29/03/19.
//

import RxSwift
import SwiftUI
import Combine

class BaseViewModel: BindableObject {
    var didChange = PassthroughSubject<BaseViewModel, Never>()
    var disposeBag: DisposeBag = DisposeBag()
}
