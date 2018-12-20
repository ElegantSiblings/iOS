//
//  PostCodeViewController.swift
//  WoowahanFresh
//
//  Created by qbbang on 20/12/2018.
//  Copyright © 2018 qbbang. All rights reserved.
//

import UIKit
import WebKit

class PostCodeViewController: UIViewController,WKScriptMessageHandler, WKNavigationDelegate  {
  
  var webView: WKWebView?
  
  let indicator = UIActivityIndicatorView(style: .gray)
  var postCode = ""
  var address = ""
  let unwind = "unwindPostCode"
  
  override func loadView() {
    super.loadView()
    
    let contentController = WKUserContentController()
    contentController.add(self, name: "callBackHandler")
    
    let config = WKWebViewConfiguration()
    config.userContentController = contentController
    
    self.webView = WKWebView(frame: .zero, configuration: config)
    self.view = self.webView!
    self.webView?.navigationDelegate = self
    
    self.webView?.addSubview(indicator)
    indicator.center.x = UIScreen.main.bounds.width/2
    indicator.center.y = UIScreen.main.bounds.height/2
  }
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    guard
      let url = URL(string: "https://qbbang.github.io/postcode/"),
      let webView = webView else { return }
    
    let request = URLRequest(url: url)
    webView.load(request)
    
    self.webView?.navigationDelegate = self
    indicator.startAnimating()
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if let identifier = segue.identifier, identifier == unwind {
      if let destination = segue.destination as? PaymentViewController {
        
        destination.txtFieldPostCode.text = postCode
        destination.txtFieldAdrees.text = address
        destination.btnOrder.isHidden = false
        
      }
    }
  }
  
  func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
    if let postCodData = message.body as? [String: Any] {
      postCode = postCodData["zonecode"] as? String ?? ""
      address = postCodData["addr"] as? String ?? ""
    }
    
    performSegue(withIdentifier: unwind, sender: self)
    
//    performSegue(withIdentifier: unwind, sender: nil)
  }
  
  func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
    UIApplication.shared.isNetworkActivityIndicatorVisible = true
    indicator.startAnimating()
  }
  
  func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
    UIApplication.shared.isNetworkActivityIndicatorVisible = false
    indicator.stopAnimating()
  }
}
