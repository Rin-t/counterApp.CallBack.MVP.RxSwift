//
//  MVPViewController.swift
//  counterApp.CallBack.MVP.RxSwift
//
//  Created by Rin on 2021/09/17.
//

import UIKit

final class MVPViewController: UIViewController {

    @IBOutlet weak var counterLabel: UILabel!

    private let presenter = MVPPresenter()

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.attachView(self)
    }


    @IBAction func countupCounter(_ sender: Any) {
        presenter.incrementCounter()
    }

    @IBAction func countdownCounter(_ sender: Any) {
        presenter.decrementCounter()
    }

    @IBAction func countReset(_ sender: Any) {
        presenter.resetCount()
    }

}

extension MVPViewController: CounterDelegate {
    func updateCount(count: Int) {
        counterLabel.text = String(count)
    }
}
