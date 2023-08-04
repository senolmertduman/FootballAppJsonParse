//
//  LivescoreVC.swift
//  FootballApp
//
//  Created by Şenol Mert Duman on 31.07.2023.
//

import UIKit
import Alamofire
import SDWebImage


class LeaguesVC: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    
    var ligler = [Competitions]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        //Search button
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.search, target: self, action: #selector(goToSearchVC))
        
        
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
        
        getLeagues()
        
    
    }
    
    @objc func goToSearchVC(){
        //SearchVC
        
    }

    
    func getLeagues(){
        let url = URL(string: "https://api.football-data.org/v4/competitions")!
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
                let json = try JSONDecoder().decode(CompetitionsResponse.self, from: data!)
                
                if let competitions = json.competitions{
                    self.ligler = competitions
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
        let index = sender as? Int
        if segue.identifier == "toTeamsVC"{
            let destinationVC = segue.destination as! TeamsVC
            destinationVC.lig = ligler[index!]
        }
    }


}





extension LeaguesVC: UICollectionViewDelegate,UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return ligler.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "leagueCell", for: indexPath) as! LeagueCell
        let lig = self.ligler[indexPath.row]
        cell.imageView.sd_setImage(with: URL(string: lig.emblem!))
        cell.competitionNameLabel.text = lig.name
        return cell
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "toTeamsVC", sender: indexPath.row)
    }
}
