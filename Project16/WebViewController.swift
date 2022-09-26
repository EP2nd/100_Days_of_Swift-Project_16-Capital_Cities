//
//  DetailViewController.swift
//  Project16
//
//  Created by Edwin Przeźwiecki Jr. on 24/09/2022.
//

import UIKit
import WebKit

// Challenge 3:
class WebViewController: UIViewController {
    @IBOutlet var webView: WKWebView!
    var urlString: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard urlString != nil else {
            print("The URL address has not been set.")
            navigationController?.popViewController(animated: true)
            return
        }
        
        if let url = URL(string: urlString) {
            webView.load(URLRequest(url: url))
        }
    }
}
