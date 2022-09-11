//
//  JournalTableViewController.swift
//  MyJournal
//
//  Created by Oskar Larsson on 2022-09-06.
//

import UIKit

class JournalTableViewController: UITableViewController {

    var JournalCell = "JournalCell"
    var journal = Journal()
    
    let segueToCreateEntry = "segueToCreateEntry"
    let segueToViewEntry = "segueToViewEntry"
    
    @IBOutlet var myTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        journal.addEntry(entry: JournalEntry(title: "Min första entry", content: "Idag hade jag min första lektion"))
        journal.addEntry(entry: JournalEntry(title: "Min andra entry", content: "Jag mår jättrebra idag"))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        myTableView.reloadData()
    }


    // Number of sections
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    // Number of rows in every section. If support for multiple secions, you can differ them by section number
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return journal.count
    }

    // Configure cell and returns. Will run once for every cell
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: JournalCell, for: indexPath)

        var content = cell.defaultContentConfiguration()
       
        if let entry = journal.getEntryAt(index: indexPath.row) {
            content.text = "\(entry.date) \(entry.title)"
            cell.contentConfiguration = content
        }
        
        

        return cell
    }
    

    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let remove = UIContextualAction(style: .destructive, title: "Delete", handler: {(action, view, completion) in
            
            self.journal.removeAt(index: indexPath.row) // Remove entry from array
            self.myTableView.deleteRows(at: [indexPath], with: .fade) // Remove row from tableView
        })
        
        
        let actions = UISwipeActionsConfiguration(actions: [remove])
        return actions
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        switch segue.identifier {
        case segueToCreateEntry:
            if let destinationVC = segue.destination as? CreateEntryViewController {
                destinationVC.journal = self.journal
            }
            break
        case segueToViewEntry:

//            if let destinationVC = segue.destination as? ExistingEntryViewController,
//               let selectedCellIndex = myTableView.indexPathForSelectedRow?.row {
//                let selectedEntry = journal.getEntryAt(index: selectedCellIndex)
//
//                destinationVC.journalEntry = selectedEntry
//            }
            
//            if let destinationVC = segue.destination as? ExistingEntryViewController,
//               let cell = sender as? UITableViewCell,
//               let indexPath = myTableView.indexPath(for: cell),
//               let entry = journal.getEntryAt(index: indexPath.row) {
//                destinationVC.journalEntry = entry
//            }
            
            guard let destinationVC = segue.destination as? ExistingEntryViewController else { return }
            guard let cell = sender as? UITableViewCell else { return }
            guard let indexPath = myTableView.indexPath(for: cell) else { return }
            guard let entry = journal.getEntryAt(index: indexPath.row) else { return }
            
            destinationVC.journalEntry = entry
                
            break
            
        default: return
        }
        
        
    }
    

}
