//
//  ViewController.swift
//  App_NCX
//
//  Created by Davide Formisano on 25/03/24.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {
    
    var items = Item(name: "", artist: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

   
    @IBSegueAction func MusicList(_ coder: NSCoder) -> UIViewController? {
        return UIHostingController(coder: coder, rootView: ListSongsView(songs: [Item]()))
    }
}

