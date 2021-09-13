//
//  NoteManager.swift
//  LearnyCards
//
//  Created by Zachary Buffington on 9/12/21.
//

import Foundation

class NoteManager {
    static let shared = NoteManager()
    var notes: [Note] = []
    var fileURL: URL {
        var url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        url.appendPathComponent("notes")
        url.appendPathComponent("json")
        return url
        
    }
    init() {
        loadNote()
    }
    func createNote(phrase: String, translation: String) {
        
        let newNote = Note(phrase: phrase, translation: translation)
        notes.append(newNote)
        saveNotes()
    }
    func loadNote() {
        do {
            let decoder = JSONDecoder()
            let data = try Data(contentsOf: fileURL)
            let notes = try decoder.decode([Note].self, from: data)
            self.notes = notes
            
        } catch  {
            print(error)
        }
    }
    func update(note: Note, newPhrase: String, newTranslation: String) {
        note.phrase = newPhrase
        note.translation = newTranslation
        saveNotes()
    }
    func delete(note: Note) {
        guard let index = notes.firstIndex(of: note) else {return}
        
        notes.remove(at: index)
        saveNotes()
    }
    func saveNotes() {
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(notes)
            try data.write(to: fileURL)
        
        } catch  {
            print(error)
        }
    }
}
