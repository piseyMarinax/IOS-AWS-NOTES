//
//  ViewController.swift
//  Notes
//
//  Created by mp001 on 1/2/19.
//  Copyright © 2019 mp001. All rights reserved.
//

import UIKit
import AWSAuthCore
import AWSAuthUI
import AWSCore
import AWSDynamoDB

// web client
// 483604363162-7ahkfasejqsrp3ut3quhttd58h2ou5nh.apps.googleusercontent.com
// web secret
// G9lnM8QsUgiZGJUk573_YYLh
// IOS
// 483604363162-mpnrdioc7odauu8bretcuqptbq3sd4li.apps.googleusercontent.com

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    @IBAction func doBtnLogout(_ sender: Any) {
        AWSSignInManager.sharedInstance().logout{(value, error) in
            self.CheckForLogin()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        CheckForLogin()
    }
    func CheckForLogin(){
        if !AWSSignInManager.sharedInstance().isLoggedIn {
            AWSAuthUIViewController.presentViewController(with: self.navigationController!, configuration: nil){ (provider,error) in
                if error == nil{
                    print("Success")
                }
                else{
                    print(error?.localizedDescription ?? "no value")
                }
            }
        }
        else{
//            createNote(noteID: "100")
//            createNote(noteID: "101")
//            createNote(noteID: "102")
//            loadNote(noteId : "123")
//            updateNote(noteId : "123",content: "Update note")
//            deleteNote(noteID : "123")
            queryNote()
        }
    }
    
    func createNote(noteID : String){
        guard let note = Note() else { return }
        note._userId   = AWSIdentityManager.default().identityId
        note._noteId   = noteID
        note._content  = "Content"
        note._creationDate = Date().timeIntervalSince1970 as NSNumber
        let df = DateFormatter()
        df.dateStyle = .short
        df.timeStyle = .short
        note._title = "My note on \(df.string(from: Date()))"
        saveNote(note: note)
    }
    
    func saveNote(note : Note){
        let dbObjectMapper = AWSDynamoDBObjectMapper.default()
        dbObjectMapper.save(note){ (error) in
            print(error?.localizedDescription ?? "no error")
        }
    }
    
    func loadNote(noteId : String){
        let dbObjectMapper = AWSDynamoDBObjectMapper.default()
        if let hashkey = AWSIdentityManager.default().identityId{
            dbObjectMapper.load(Note.self, hashKey: hashkey, rangeKey: noteId){
                (model,error) in
                if let note = model as? Note{
                    print(note._content ?? "no content")
                }
            }
        }
    }
    
    func updateNote(noteId : String, content: String){
        let dbObjectMapper = AWSDynamoDBObjectMapper.default()
        if let hashkey = AWSIdentityManager.default().identityId{
            dbObjectMapper.load(Note.self, hashKey: hashkey, rangeKey: noteId){
                (model,error) in
                if let note = model as? Note{
                    note._content = content
                    self.saveNote(note: note)
                }
            }
        }
    }
    
    func deleteNote(noteID: String){
        if let note = Note() {
            note._userId = AWSIdentityManager.default().identityId
            note._noteId = noteID
            let dbObjectMapper = AWSDynamoDBObjectMapper.default()
            dbObjectMapper.remove(  note){ (error) in
                print(error?.localizedDescription ?? "no Error")
                
            }
        }
    }
    func queryNote(){
        let qExp = AWSDynamoDBQueryExpression()
        
        qExp.keyConditionExpression = "#uId = :userId and #noteId > :someId"
        
        qExp.expressionAttributeNames = ["#uId":"userId", "#noteId":"noteId"]
        
        qExp.expressionAttributeValues =
            [":userId": AWSIdentityManager.default().identityId!, ":someId":"100"]
        
        let dbObjectMapper = AWSDynamoDBObjectMapper.default()
        dbObjectMapper.query(Note.self, expression: qExp){ (output,error) in
            if let notes = output?.items as? [Note]{
                notes.forEach({ (note) in
                    print(note._content ?? "no content")
                    print(note._noteId ?? "no noteId")
                })
            }
            
        }
    }
}

