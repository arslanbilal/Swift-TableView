//
//  MoreViewController.swift
//  Swift-TableView-Example
//
//  Created by Bilal ARSLAN on 12/10/14.
//  Copyright (c) 2014 Bilal ARSLAN. All rights reserved.
//

import Foundation
import UIKit

class MoreViewController: UIViewController {

    @IBOutlet var webView: UIWebView?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        let url: URL = URL(string: "https://github.com/arslanbilal")!
        webView!.loadRequest(URLRequest(url: url))
    }
}
