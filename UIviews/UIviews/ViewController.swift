//
//  ViewController.swift
//  UIviews
//
//  Created by desarrollador11 on 30/05/22.
//

import UIKit
import WebKit
import MapKit
//import SwiftUI
//struct DropdownOptionElement: View {
//    var val: String
//    var key: String
//    var onSelect: ((_ key: String) -> Void)?
//
//    var body: some View {
//        VStack(alignment: .leading, spacing: 15){
//            Text("aeaman").font(.largeTitle)
//        }
//    }
//}

class ViewController: UIViewController {
    
    // the StackView allow us to expand and contrain the view of the items
    // inside our views in the apps
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var dividerView: NSLayoutConstraint!
    @IBOutlet weak var myButton: UIButton!
    @IBOutlet weak var myView: UIView!
    @IBOutlet weak var myWebView: WKWebView!
    @IBOutlet weak var myMapView: MKMapView!
    @IBOutlet weak var myDropDownButton: UIButton!
    
    @IBOutlet weak var firstButton: UICommand!
    
    @IBOutlet weak var asd: UIMenu!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        myWebView.load(URLRequest(url: URL(string: "https://www.google.com/")!))
        myDropDownButton.viewWithTag(5)
//        myDropDownButton.menu.insertChild(UIMenu(title: "DropDownButton", options: UIMenu.Options.displayInline, children: []), atEndOfMenu: <#T##UIMenuIdentifier#>)
    }
    @IBAction func myButtonImage(_ sender: Any) {
        if myView.isHidden == false {
            myView.isHidden =  true
        } else{
            myView.isHidden = false
        }
    }
    
    @IBAction func myDropDownButtonAction(_ sender: Any) {
        
    }
}


