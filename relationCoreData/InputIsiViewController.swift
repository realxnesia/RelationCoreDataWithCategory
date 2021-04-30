//
//  InputIsiViewController.swift
//  relationCoreData
//
//  Created by DHIKA ADITYA ARE on 30/04/21.
//

import UIKit
import CoreData

class InputIsiViewController: UIViewController {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var isiArray = [Isi]()
    var selectedCategory: Kategori?
    
    @IBOutlet weak var namaLabel: UITextField!
    @IBOutlet weak var noLabel: UITextField!
    @IBOutlet weak var indexLabel: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func saveData(){
        do {
            try context.save()
        } catch {
        }
    }
    
    @IBAction func buttoIsiSendToCoreData(_ sender: UIButton) {
        //MARK: label ISI yg berbeda
        let isiSave = Isi(context: context)
        isiSave.nama = namaLabel.text
        isiSave.notlp = noLabel.text
        isiSave.parentKategori = selectedCategory
        saveData()
    }
    @IBAction func deleteButton(_ sender: UIButton) {
        let temp: Int? = Int(indexLabel.text!)
        //print(temp)
        deleteIsiCoreData(index: temp!)
    }
    
    func getDataFromCoreData() {
        do{
            isiArray = try self.context.fetch(Isi.fetchRequest())
        }catch{
        }
        saveData()
    }
    
    var deleteIsi: Isi?
    func deleteIsiCoreData(index: Int) {
        deleteIsi = isiArray[index]
        context.delete(deleteIsi!)
        do {
            try context.save()
        } catch {
        }
    }
    
}
