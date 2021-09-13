//
//  LearnyTableViewController.swift
//  LearnyCards
//
//  Created by Zachary Buffington on 9/12/21.
//

import UIKit

class LearnyTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    @IBAction func addButtonTapped(_ sender: Any) {
      
        let alert = UIAlertController(title: "New Flash Card", message: "", preferredStyle: .alert)
        
        alert.addTextField { textField in
            textField.placeholder = "English"
        }
        alert.addTextField { textField in
            textField.placeholder = "Japanese"
        }
        
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel)
        alert.addAction(cancelButton)
        
        let saveButton = UIAlertAction(title: "Save", style: .default) { _ in
            
            guard let titleField = alert.textFields?.first,
                  let subtitleField = alert.textFields?.last else { return }
            
            let title = titleField.text ?? "No title"
            let subtitle = subtitleField.text ?? ""
            
            
            NoteManager.shared.createNote(phrase: title, translation: subtitle)
            
            
            
            self.tableView.reloadData()
        }
        alert.addAction(saveButton)
        
        
        present(alert, animated: true)
        
    }
    
    
    // MARK: - Table view data source
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return NoteManager.shared.notes.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "noteCell", for: indexPath)
        let note = NoteManager.shared.notes[indexPath.row]
        cell.textLabel?.text = note.phrase
        // Configure the cell...
        
        return cell
    }
    
    
    
    
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let note = NoteManager.shared.notes[indexPath.row]
            NoteManager.shared.delete(note: note)
            tableView.deleteRows(at: [indexPath], with: .fade)
            
            
            
            
        }
    }
    
    
    






// MARK: - Navigation


override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    guard segue.identifier == "updateNote",
          let indexPath = tableView.indexPathForSelectedRow,
          let destination = segue.destination as? NoteViewController else {return}
    let note = NoteManager.shared.notes[indexPath.row]
    destination.note = note
    
}



}
