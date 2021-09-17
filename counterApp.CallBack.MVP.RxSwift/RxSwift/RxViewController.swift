//
//  RxViewController.swift
//  counterApp.CallBack.MVP.RxSwift
//
//  Created by Rin on 2021/09/17.
//

import UIKit
import RxSwift
import RxCocoa


final class RxViewController: UIViewController {

    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var countUpButton: UIButton!
    @IBOutlet weak var countDownButton: UIButton!
    @IBOutlet weak var resetCountButton: UIButton!

    private let disposeBag = DisposeBag()
    private var viewModel: RxViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewModel()
    }

    private func setupViewModel() {

        viewModel = RxViewModel()

        let input = RxViewModelInput(
            countUpButton: countUpButton.rx.tap.asObservable(),
            countDown: countDownButton.rx.tap.asObservable(),
            countResetBtton: resetCountButton.rx.tap.asObservable()
        )

        viewModel.setup(input: input)

        viewModel.outputs?.counterText
            .drive(countLabel.rx.text)
            .disposed(by: disposeBag)
    }


}
