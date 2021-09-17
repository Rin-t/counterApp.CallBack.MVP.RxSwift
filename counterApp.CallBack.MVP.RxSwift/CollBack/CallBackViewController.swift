//
//  CallBackViewController.swift
//  counterApp.CallBack.MVP.RxSwift
//
//  Created by Rin on 2021/09/17.
//

import Foundation


final class CallBackViewModel {

    private(set) var count = 0

    func incrementCount(callback: (Int) -> ()) {
        count += 1
        callback(count)
    }

    func decrementCount(callback: (Int) -> ()) {
        count -= 1
        callback(count)
    }

    func resetCount(callback: (Int) -> ()) {
        count = 0
        callback(count)
    }
}
