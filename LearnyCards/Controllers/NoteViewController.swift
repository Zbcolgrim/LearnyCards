//
//  NoteViewController.swift
//  LearnyCards
//
//  Created by Zachary Buffington on 9/12/21.
//

import UIKit

class NoteViewController: UIViewController {
    var note: Note?
    
    @IBOutlet weak var translationLabelView: UILabel!
    @IBOutlet weak var phraseLabelView: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        phraseLabelView.text = "πΊπΈ \(note!.phrase)"
        translationLabelView.text = " π―π΅ \(note!.translation)"

        
    }
    


}
