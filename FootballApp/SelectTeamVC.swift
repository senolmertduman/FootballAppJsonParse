//
//  SelectTeamVC.swift
//  FootballApp
//
//  Created by Şenol Mert Duman on 4.08.2023.
//

import UIKit
import SDWebImage

class SelectTeamVC: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    var takimlar = [Teams]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getAllTeams()
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
    }
    
//to get all teams from API
    func getAllTeams(){
        let url = URL(string: "http://api.football-data.org/v4/teams")!
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
                    self.tableView.reloadData()
                }
            }catch{
                print(error.localizedDescription)
            }
        }.resume()
    }
    func searchedTeams(teamName:String){
        var searchTeams = [Teams]()
        let url = URL(string: "http://api.football-data.org/v4/teams")!
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
                    for i in takimlar{
                        if let takim = i.name{
                            if takim.contains(teamName){
                                searchTeams.append(i)
                            }
                        }
                    }
                }
                self.takimlar = searchTeams
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }catch{
                print(error.localizedDescription)
            }
        }.resume()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toMyClubVC"{
            let index = sender as? Int
            let destinationVC = segue.destination as! MyClubVC
            destinationVC.takimim = takimlar[index!]
            destinationVC.selectedTeam = true
        }
    }
}

extension SelectTeamVC:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return takimlar.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "searchedTeamsCell", for: indexPath) as! SearchedTeamsCell
        let team = takimlar[indexPath.row]
        cell.teamImage.sd_setImage(with: URL(string: team.crest!))
        cell.teamNameLabel.text = team.name
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "toMyClubVC", sender: indexPath.row)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50.0
    }
}
extension SelectTeamVC:UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText == ""{
            getAllTeams()
            
        }else{
            searchedTeams(teamName: searchText)
        }
    }
    
}
