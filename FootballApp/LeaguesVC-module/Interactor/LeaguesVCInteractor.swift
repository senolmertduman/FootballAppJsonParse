//
//  LeaguesVCInteractor.swift
//  FootballApp
//
//  Created by Şenol Mert Duman on 12.08.2023.
//

import Foundation

class LeaguesVCInteractor:PresentertoInteractorLeaguesVCProtocol{
    var presenter: InteractortoPresenterLeaguesVCProtocol?
    
    func getCompetitions() {
        let url = URL(string: "https://api.football-data.org/v4/competitions")!
        let headers = ["X-Auth-Token": "0eac9834de9f44719b75e71ee9095463"]
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
                    self.presenter?.sendDatatoLeaguesVCPresenter(competitions: competitions)
                }
            }catch{print(error.localizedDescription)}
        }.resume()
    }
}
