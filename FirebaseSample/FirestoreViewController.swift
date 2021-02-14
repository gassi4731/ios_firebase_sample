//
//  FirestoreViewController.swift
//  FirebaseSample
//
//  Created by Yo Higashida on 2021/02/14.
//

import UIKit
import Firebase
import FirebaseFirestore

class FirestoreViewController: UIViewController {
    
    // 保存するArray配列
    var firestoreData: Array<Dictionary<String, String>> = []
    
    // 表示するラベル
    @IBOutlet var dataLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getFirestoreData()
    }
    
    // ラベルに値を表示
    override func viewDidAppear(_ animated: Bool) {
        print(firestoreData[0]["title"]!)
        dataLabel.text = firestoreData[0]["title"]!
    }
    
    // Firestoreからデータを取得
    private func getFirestoreData() {
        let db = Firestore.firestore()
        db.collection("techmon").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    self.firestoreData.append(document.data() as! Dictionary)
                    
                    print("\(document.documentID) => \(document.data())")
                }
            }
        }
    }
}
