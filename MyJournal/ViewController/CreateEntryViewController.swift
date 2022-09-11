//
//  CreateEntryViewController.swift
//  MyJournal
//
//  Created by Oskar Larsson on 2022-09-06.
//

import UIKit

class CreateEntryViewController: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var switchDate: UISwitch!
    @IBOutlet weak var txtTitle: UITextField!
    
    @IBOutlet weak var txtContent: UITextView!
    
    var journal: Journal?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        txtContent.layer.borderWidth = 1
        txtContent.layer.borderColor = UIColor.init(red: 150/255, green: 150/255, blue: 150/255, alpha: 0.2).cgColor
        
        txtContent.layer.cornerRadius = 10.0
        
        datePicker.isHidden = !switchDate.isOn
    }
    
    

    @IBAction func onSave(_ sender: Any) {
        
        if let title = txtTitle.text,
           let journal = journal,
           let content = txtContent.text {
           
            if title != "" && content != "" {
             
                if switchDate.isOn {
                    journal.addEntry(entry: JournalEntry(title: title, content: content, date: datePicker.date))
                } else {
                    journal.addEntry(entry: JournalEntry(title: title, content: content))
                }
                
                self.navigationController?.popViewController(animated: true)
            }
            
        }
        
        
        
    }
    
   
    @IBAction func onSwitch(_ sender: UISwitch) {
        datePicker.isHidden = !sender.isOn
    }
    
}
