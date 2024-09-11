//
//  ViewController-tahmin.swift
//  Sayı_Tahmin_Oyunu
//
//  Created by Mücahit Yıldırım on 9.09.2024.
//

import UIKit

class ViewController_tahmin: UIViewController {
    
    @IBOutlet weak var SayıTahminLabel: UILabel!
    @IBOutlet weak var zarImage: UIImageView!
    @IBOutlet weak var KalanHakLabel: UILabel!
    @IBOutlet weak var TahminTextField: UITextField!
    @IBOutlet weak var TahminYardım: UILabel!
    
    var randomSayı: Int?
    var kalanHak = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()
        randomSayı = Int(arc4random_uniform(100)) //100'e kadar random sayı seçer
        print(randomSayı!)
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let gelenVeri = sender as? Bool{
            let gidilecekVC = segue.destination as! ViewController_Sonuc
            gidilecekVC.sonuc = gelenVeri
        }
    }
    
    @IBAction func TahminEtButton(_ sender: UIButton) {
        
        TahminYardım.isHidden = false
        kalanHak-=1 //her tahminde bir azalacak
        
        if let veri = TahminTextField.text { // Textfield üzerinden veri kontrol edilerek alınır
         
            if let tahmin = Int(veri){//String ifadeye kontrol ederek int ifadeyi dönüştürürüz.
                
                    if tahmin  == randomSayı!{//Tahmin random sayıya eşitse kazanılır.
                        let sonuc = true
                        performSegue(withIdentifier: "tahminToSonuc", sender: sonuc)//kazanılırsa sayfa geçişi ve veri transferi
                        return //kazandıktan somra işlem yapılmaması için return kullandık
                        //return buttonun çalşımasını durdurur ve ruturn ifadesinin yer aldığı satırdan sonraki kodlar çalışmaz.
                        
                    }
                    if tahmin > randomSayı!{
                        TahminYardım.text = "Azalt"
                        KalanHakLabel.text = "Kalan Hak : \(kalanHak)"
                    }
                    if tahmin < randomSayı! {
                        TahminYardım.text = "Artır"
                        KalanHakLabel.text = "Kalan Hak : \(kalanHak)"
                    }
                if (kalanHak == 0){
                    let sonuc = false
                    performSegue(withIdentifier: "tahminToSonuc", sender: sonuc)
                    //haklar bitince sayfa geçişi ve veri transferi
                }
                TahminTextField.text = "" // her tahmin yazımından sonra textFieldın içini boşaltıyor

            }
         
        }
        
    }
}
