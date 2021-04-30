////
////  HalamanUtamaViewController.swift
////  relationCoreData
////
////  Created by DHIKA ADITYA ARE on 29/04/21.
////
//
////import UIKit
////import CoreData
////
//class HalamanUtamaViewController: UIViewController {
//  let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
//////
// var isiArray = [Isi]()
//  var selectedCategory: Kategori? {
//       didSet{
//            loadItems()
//            //getDataFromCoreData()
//        }
//    }
//
//    @IBOutlet weak var valueNama: UILabel!
//    @IBOutlet weak var valueNo: UILabel!
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
        //getDataFromCoreData()
//        loadItems()
//        //valueNama.text = isiArray
//    }
//
//
//    func loadItems(with request: NSFetchRequest<Isi> = Isi.fetchRequest()){
//        //error disini, gaboleh ? opsional harus di force!
//        let predicate = NSPredicate(format: "parentkategori.listKategori MATCHES %@", selectedCategory!.listKategori!)
//        request.predicate = predicate
//        do {
//            isiArray = try context.fetch(request)
//        } catch  {
//        }
//        //valueNama.text = isiArray
//    }
//
//    func loadData() {
//        //valueNama.text = isiArray.no
//    }
//
//    func getDataFromCoreData() {
//        let predicate = NSPredicate(format: "parentkategori.listKategori MATCHES %@", selectedCategory!.listKategori!)
//        //request.predicate = predicate
//
//        do{
//            isiArray = try self.context.fetch(Isi.fetchRequest())
//        }catch{
//        }
//
//        do {
//            try context.save()
//        } catch {
//        }
//    }

//}
