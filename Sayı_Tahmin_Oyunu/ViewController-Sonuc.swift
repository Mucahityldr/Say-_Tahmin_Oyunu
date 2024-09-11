//
//  ViewController-Sonuc.swift
//  Sayı_Tahmin_Oyunu
//
//  Created by Mücahit Yıldırım on 9.09.2024.
//

import UIKit

class ViewController_Sonuc: UIViewController {

    @IBOutlet weak var SayıTahminLabel: UILabel!
    @IBOutlet weak var SonucImage: UIImageView!
    @IBOutlet weak var SonucLabel: UILabel!
    
    var sonuc: Bool?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true //navigation'da bullunan geri tuşunu saklamaya yarar.
        
        if sonuc!{
            SonucLabel.text = "KAZANDINIZ"
            SonucImage.image = UIImage(named: "mutlu_resim")
        }else{
            SonucLabel.text = "KAYBETTİNİZ"
            SonucImage.image = UIImage(named: "uzgun_resim")        }
    }

    @IBAction func TekrarOynaButton(_ sender: UIButton) {
        navigationController?.popToRootViewController(animated: true) //en baş sayfaya gitmek için kullanılır
    }
    
}
