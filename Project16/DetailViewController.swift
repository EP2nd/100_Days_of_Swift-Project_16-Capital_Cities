//
//  DetailViewController.swift
//  Project16
//
//  Created by Edwin Przeźwiecki Jr. on 24/09/2022.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {
    var webView: WKWebView!
    var detailItem: Capital!
    
    override func loadView() {
        webView = WKWebView()
        view = webView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let html = "https://en.wikipedia.org/wiki/\(detailItem.title)"
        
        webView.loadHTMLString(html, baseURL: nil)
    }
}
