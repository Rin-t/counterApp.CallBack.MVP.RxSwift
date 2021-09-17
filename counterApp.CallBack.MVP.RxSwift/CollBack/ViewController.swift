//
//  ViewController.swift
//  counterApp.CallBack.MVP.RxSwift
//
//  Created by Rin on 2021/09/16.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var countLabel: UILabel!

    private var viewModel: CallBackViewModel!
    // private var viewModel = CallBackViewModel() ←これでもいける

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = CallBackViewModel()
    }

    @IBAction func countUp(_ sender: Any) {
        viewModel.incrementCount { [weak self] count in
            self?.updateCountLabel(count)
        }
    }

    @IBAction func countDown(_ sender: Any) {
        viewModel.decrementCount { [weak self] count in
            self?.updateCountLabel(count)
        }
    }

    @IBAction func countReset(_ sender: Any) {
        viewModel.resetCount { [weak self] count in
            self?.updateCountLabel(count)
        }
    }

    private func updateCountLabel(_ count: Int) {
        countLabel.text = String(count)
    }

}

