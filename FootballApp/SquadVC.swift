//
//  SquadVC.swift
//  FootballApp
//
//  Created by Şenol Mert Duman on 3.08.2023.
//

import UIKit

class SquadVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var team = Teams()
    var squad = [Persons]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        navigationItem.title = team.name!
        getTeam()
    }
    
    func getTeam(){
        let url = URL(string: "https://api.football-data.org/v4/teams/\(team.id!)")!
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
                let json = try JSONDecoder().decode(Teams.self, from: data!)
                if let oyuncular = json.squad{
                    self.squad = oyuncular
                }
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }catch{
                print(error.localizedDescription)
            }
        }.resume()
    }


}
extension SquadVC:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return squad.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "personCell", for: indexPath) as! PersonCell
        let person = squad[indexPath.row]
        let position = String(person.position!.prefix(3))
        cell.personPosition.text = position.uppercased()
        cell.personName.text = person.name
        return cell
    }
}
