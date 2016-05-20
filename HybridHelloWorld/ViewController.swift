//
//  ViewController.swift
//  HybridHelloWorld
//
//  Created by Samuël Maljaars on 20/05/16.
//  Copyright © 2016 smaljaars. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIWebViewDelegate {

    @IBOutlet weak var myWebView: UIWebView!
    
    @IBAction func reloadWebPage(sender: AnyObject) {
        
        myWebView.reload()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        myWebView.accessibilityIdentifier = "myWebView"
        myWebView.delegate = self
        
        let request = NSURLRequest(URL: NSURL(string: "https://www.google.com")!)
        myWebView.loadRequest(request)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: UIWebViewDelegate
    
    func webViewDidStartLoad(webView: UIWebView) {
        print("didstart")
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        print("didfinish")
    }
    
    func webView(webView: UIWebView, didFailLoadWithError error: NSError?) {
        print("didfail \(error?.localizedDescription)")
    }
    
    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        print("shouldstartload")
        return true
    }

    
}

