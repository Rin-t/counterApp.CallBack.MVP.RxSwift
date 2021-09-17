//
//  RxViewModel.swift
//  counterApp.CallBack.MVP.RxSwift
//
//  Created by Rin on 2021/09/17.
//

import Foundation
import RxSwift
import RxCocoa

struct RxViewModelInput {
    let countUpButton: Observable<Void>
    let countDown: Observable<Void>
    let countResetBtton: Observable<Void>
}

protocol RxViewModelOutput {
    var counterText: Driver<String?> { get }
}

protocol CounterViewModelType {
    var outputs: RxViewModelOutput? { get }
    func setup(input: RxViewModelInput)
}

final class RxViewModel: CounterViewModelType {

    var outputs: RxViewModelOutput?

    private let countRelay = BehaviorRelay<Int>(value: 0)
    private let initialCount = 0
    private let dispodeBag = DisposeBag()

    init() {
        self.outputs = self
        resetCount()
    }

    func setup(input: RxViewModelInput) {

        input.countUpButton
            .subscribe (onNext: { [weak self] _ in
                self?.incrementCount()
            })
            .disposed(by: dispodeBag)

        input.countDown
            .subscribe { [weak self] _ in
                self?.decremenCount()
            }
            .disposed(by: dispodeBag)

        input.countResetBtton
            .subscribe { [weak self] _ in
                self?.resetCount()
            }
            .disposed(by: dispodeBag)

    }

    private func incrementCount() {
        let count = countRelay.value + 1
        countRelay.accept(count)
    }

    private func decremenCount() {
        let count = countRelay.value - 1
        countRelay.accept(count)
    }

    private func resetCount() {
        countRelay.accept(initialCount)
    }


}

extension RxViewModel: RxViewModelOutput {
    var counterText: Driver<String?> {
        return countRelay
            .map {
                print($0)
                return String($0)
            }
            .asDriver(onErrorJustReturn: nil)
    }
}
