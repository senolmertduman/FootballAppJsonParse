//
//  TeamsVC.swift
//  FootballApp
//
//  Created by Şenol Mert Duman on 2.08.2023.
//

import UIKit
import SDWebImage

class TeamsVC: UIViewController {
    var takimlar = [Teams]()
    var lig = Competitions()

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        navigationItem.title = lig.name!
        //Tasarim
        let tasarim = UICollectionViewFlowLayout()
        let genislik = self.collectionView.frame.width
        let yukseklik = self.collectionView.frame.height
        let itemSize = (genislik - 30) / 2
        tasarim.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: yukseklik - itemSize + 20, right: 10)
        tasarim.minimumLineSpacing = 10
        tasarim.minimumInteritemSpacing = 10
        tasarim.itemSize = CGSize(width: itemSize, height: itemSize)
        collectionView.collectionViewLayout = tasarim
        
        getTeams()
    }

    func getTeams(){
        let url = URL(string: "http://api.football-data.org/v4/competitions/\(lig.code!)/teams")!
        let headers = [
            "X-Auth-Token": "0eac9834de9f44719b75e71ee9095463"
        ]
        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = headers
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if error != nil || data == nil{
                print("hata")
                return
            }
            do{
                let json = try JSONDecoder().decode(TeamsResponse.self, from: data!)
                if let takimlar = json.teams{
                    self.takimlar = takimlar
                }
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            }catch{
                print(error.localizedDescription)
            }
        }.resume()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSquadVC"{
            let index = sender as? Int
            let destinationVC = segue.destination as! SquadVC
            destinationVC.team = takimlar[index!]
        }
    }
}

extension TeamsVC:UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let takim = takimlar[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "teamCell", for: indexPath) as! TeamCell
        let imageUrl = takim.crest!
        if imageUrl.hasSuffix(".svg"){
            cell.teamImage.image = UIImage(named: "noimage")
        }else{
            cell.teamImage.sd_setImage(with: URL(string: imageUrl))
        }
        cell.teamNameLabel.text = takim.name
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return takimlar.count
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "toSquadVC", sender: indexPath.row)
    }
}
