//
//  CategoryViewController.swift
//  relationCoreData
//
//  Created by DHIKA ADITYA ARE on 29/04/21.
//

import UIKit
import CoreData

class CategoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableKategori: UITableView!
    
    //MARK: Penyimpanan
    var kategoriArray = [Kategori]() //array kosong
    //var kategoriArray: [Kategori] = []
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableKategori.delegate = self
        tableKategori.dataSource = self
        getDataFromCoreData()
        //printData()
    }
    
    

    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
    }
    
    //MARK: TV data source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return kategoriArray.count
    }
    
    //MARK: TV delegate
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
        cell.textLabel?.text = kategoriArray[indexPath.row].listKategori
        return cell
    }
    
    func getDataFromCoreData() {
        do{
            kategoriArray = try self.context.fetch(Kategori.fetchRequest())
        }catch{
        }
        do {
            try context.save()
        } catch {
        }
    }
    
    
//    func printData(){
//        for story in kategoriArray{
//            print("kategori : \(story.listKategori)")
//        }
//    }
    
    //MARK: table view delegate methods
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToItems", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "goToItems"){
            let destinationVC = segue.destination as! SecHalUtamaViewController
            if let indexPath = tableKategori.indexPathForSelectedRow{
                destinationVC.selectedCategory = kategoriArray[indexPath.row]
                print(destinationVC.selectedCategory!)
            }
        }
        
        //let destinationVC = segue.destination as! SecHalUtamaViewController

        //ambil kategori berdasarkan cell yg dipilih (validasiin karena bisa kosong)
     
        
        
//        if(segue.identifier=="goToItems"){
//            let destinationVC = segue.destination as! SecHalUtamaViewController
//            //destinationVC.curhat = curhatToPass
//            //destinationVC.rcvKategori = ygmau dikirim
//            destinationVC.selectedCategory = kategoriArray[indexPath]
//        }else{
//            return
//        }
        
    }
    

  

}
