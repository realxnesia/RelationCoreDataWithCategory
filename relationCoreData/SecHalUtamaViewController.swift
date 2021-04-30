//
//  SecHalUtamaViewController.swift
//  relationCoreData
//
//  Created by DHIKA ADITYA ARE on 30/04/21.
//

import UIKit
import CoreData

class SecHalUtamaViewController: UIViewController {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var isiArray = [Isi]()
    
    var indexCounter = 1
    
    var selectedCategory: Kategori?{
        didSet{
            loadItems()
            //var temp: Int = isiArray.count
            //print(temp)
        }
    }

    @IBOutlet weak var namaValue: UILabel!
    @IBOutlet weak var noValue: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //print(isiArray.count)
        dataDummy()
        //namaValue.text = isiArray[indexConter].nama
        
    }
    
    func dataDummy(){
        if isiArray.count == 0 {
            namaValue.text = ""
        }else{
            namaValue.text = isiArray[indexCounter].nama
        }
    }
    
    func loadItems(with request: NSFetchRequest<Isi> = Isi.fetchRequest()){
        //error disini, gaboleh ? opsional harus di force!
        let predicate = NSPredicate(format: "parentKategori.listKategori MATCHES %@", selectedCategory!.listKategori!)
        request.predicate = predicate
        do {
            isiArray = try context.fetch(request)
        } catch  {
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "goToEditIsi"){
            let destinationVC = segue.destination as! InputIsiViewController
            destinationVC.selectedCategory = selectedCategory
            
        }

    }
}
