//
//  RxSwift+Helpers.swift
//  Shows
//
//  Created by Alon Haiut on 26/11/2018.
//  Copyright © 2018 Alon Haiut. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

extension ObservableType {
    func voidify() -> Observable<Void> {
        return self.map { _ in }
    }

    func unwrap<T>() -> Observable<T> where Element == T? {
        return self
            .filter { $0 != nil }
            .map { $0! }
    }
}

extension ObserverType where Element == Void {
    func onNext() {
        self.onNext(())
    }
}
