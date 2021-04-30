//
//  InputKategoriViewController.swift
//  relationCoreData
//
//  Created by DHIKA ADITYA ARE on 29/04/21.
//

import UIKit
import CoreData

class InputKategoriViewController: UIViewController {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
    var kategoriArray = [Kategori]()
    var isiArray = [Isi]()
//    var kategoriArray : [Kategori] = []
//    var isiArray : [Isi] = []

    
    @IBOutlet weak var kategoriLabel: UITextField!
    @IBOutlet weak var nama: UITextField!
    @IBOutlet weak var nomor: UITextField!
    @IBOutlet weak var indexKategori: UITextField!
    
    @IBOutlet weak var indexisi: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        //deleteKategoriCoreData(index: 1)
    }
    
    @IBAction func kategoriAction(_ sender: UITextField) {
    }
    @IBAction func namaAction(_ sender: UITextField) {
    }
    @IBAction func noAction(_ sender: UITextField) {
    }
    
    //MARK: Kategori save
    @IBAction func saveCoreData(_ sender: UIButton) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let kategoriSave = Kategori(context: context)
        kategoriSave.listKategori = kategoriLabel.text
        
        //MARK: label ISI yg berbeda
        let isiSave = Isi(context: context)
        isiSave.nama = nama.text
        isiSave.notlp = nomor.text
        
        do {
            try context.save()
        } catch {
        }
        
        dismiss(animated: true, completion:nil )
    }
 
//    @IBAction func saveCoreDataIsi(_ sender: UIButton) {
//        //MARK: label ISI yg berbeda
//        let isiSave = Isi(context: context)
//        isiSave.nama = nama.text
//        isiSave.notlp = nomor.text
//
//        do {
//            try context.save()
//        } catch {
//        }
//        
//    }
    
    func getDataFromCoreData() {
        do{
            kategoriArray = try self.context.fetch(Kategori.fetchRequest())
            isiArray = try self.context.fetch(Isi.fetchRequest())
        }catch{
            
        }
        //Save Data
        do {
            try context.save()
        } catch {
        }
    }
    
    func printData(){
        getDataFromCoreData()
        print("===Jumlah ArrayKategori: \(kategoriArray.count)===")
        for i in kategoriArray{
            print("Kategori : \(i.listKategori!)")
        }
        
        print("===Jumlah ArrayIsi: \(isiArray.count)===")
        for x in isiArray{
            print("Isi : \(x.nama)")
            print("nomor : \(x.notlp)")
        }
    }
    
    @IBAction func buttonPrint(_ sender: UIButton) {
        printData()
    }
    

    var deleteKategori: Kategori?
    func deleteKategoriCoreData(index: Int) {
        deleteKategori = kategoriArray[index]
        context.delete(deleteKategori!)
        do {
            try context.save()
        } catch {
        }
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
    
    @IBAction func buttonDeleteKategori(_ sender: Any) {
        let temp: Int? = Int(indexKategori.text!)
        //print(temp)
        deleteKategoriCoreData(index: temp!)
    }
    
    @IBAction func buttonDeleteIsi(_ sender: UIButton) {
        let temp: Int? = Int(indexisi.text!)
        //print(temp)
        deleteIsiCoreData(index: temp!)
    }
    
    
    

}
