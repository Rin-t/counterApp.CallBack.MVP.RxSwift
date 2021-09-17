//
//  MVPViewModel.swift
//  counterApp.CallBack.MVP.RxSwift
//
//  Created by Rin on 2021/09/17.
//

import Foundation

protocol CounterDelegate {
    func updateCount(count: Int)
}

class MVPPresenter {

    private var count = 0 {
        didSet {
            delegate?.updateCount(count: count)
        }
    }

    private var delegate: CounterDelegate?

    func attachView(_ delegate: CounterDelegate) {
        self.delegate = delegate
    }

    func detachView() {
        self.delegate = nil
    }

    func incrementCounter() {
        count += 1
    }

    func decrementCounter() {
        count -= 1
    }

    func resetCount() {
        count = 0
    }
}
