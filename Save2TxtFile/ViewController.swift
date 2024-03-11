//
//  ViewController.swift
//  Save2TxtFile
//
//  Created by student on 3/9/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var typeTF: UITextView!
    @IBOutlet weak var displayTF: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        typeTF.text = "Type the new text here"
        displayTF.text = ""
    }
    
    @IBAction func readBtn(_ sender: UIButton) {
        let fm = FileManager.default
        let urls = fm.urls(for: .documentDirectory, in: .userDomainMask)
        let url = urls.last?.appendingPathComponent("file.txt")
        
        do {
            let fileContent = try String(contentsOf: url!, encoding: String.Encoding.utf8)
            
            displayTF.text = fileContent
        }
        catch {
            print("Error reading file")
        }
    }
    
    @IBAction func writeBtn(_ sender: UIButton) {
        let fm = FileManager.default
        let urls = fm.urls(for: .documentDirectory, in: .userDomainMask)
        let url = urls.last?.appendingPathComponent("file.txt")
        
        do {
            try typeTF.text.write(to: url!, atomically: true, encoding: String.Encoding.utf8)
        }
        catch {
            print("Error writing to file")
        }
    }
}
