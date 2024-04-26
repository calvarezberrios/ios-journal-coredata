//
//  CreateEntryViewController.swift
//  Journal
//
//  Created by Carlos E. Alvarez-Berrios on 4/25/24.
//

import UIKit

class CreateEntryViewController: UIViewController {

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var bodyTextView: UITextView!
    @IBOutlet weak var moodSegmentedControl: UISegmentedControl!
    
    var entryController: EntryController?
    var entry: Entry?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateViews()
    }
    
    private func updateViews() {
        if let entry = entry {
            titleTextField.text = entry.title
            bodyTextView.text = entry.bodyText
            
            if let mood = Mood(rawValue: entry.mood ?? "😐"),
               let index = Mood.allCases.firstIndex(of: mood) {
                moodSegmentedControl.selectedSegmentIndex = index
            }
        }
    }
    

    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func save(_ sender: Any) {
        if let title = titleTextField.text, !title.isEmpty,
           let body = bodyTextView.text, !body.isEmpty {
            
            let moodIndex = moodSegmentedControl.selectedSegmentIndex
            let mood = Mood.allCases[moodIndex]
            
            if let entry = entry {
                entryController?.updateEntry(entry: entry, with: title, mood: mood, body: body)
            } else {
                entryController?.createEntry(with: title, mood: mood, body: body, context: CoreDataStack.shared.mainContext)
            }
            
            dismiss(animated: true)
        }
    }
}
