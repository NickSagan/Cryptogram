//
//  ViewController.swift
//  Cryptogram
//
//  Created by Nick Sagan on 06.02.2022.
//

import UIKit

class ViewController: UIViewController {
    
    let key: String = "44 52 d7 16 87 b6 bc 2c 93 89 c3 34 9f dc 17 fb 3d fb ba 62 24 af fb 76 76 e1 33 79 26 cd d6 02"
    
    @IBOutlet weak var inputText: UITextView!
    @IBOutlet weak var outputText: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func encryptPressed(_ sender: UIButton) {
        let text = inputText.text!
        var encryptedText: String?
        do {
            let tryToEncrypt: String? = try Encryption.encryptData(plainText: text, hexKey: key)
            encryptedText = tryToEncrypt
        } catch {
            print(error)
        }
        
        outputText.text = encryptedText
    }
    
    @IBAction func decryptPressed(_ sender: UIButton) {
    }
    
    @IBAction func sendEncryptedText(_ sender: UIButton) {
    }
    
    @IBAction func sendKey(_ sender: UIButton) {
    }
    

}

