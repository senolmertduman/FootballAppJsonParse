//
//  LeaguesVCProtocols.swift
//  FootballApp
//
//  Created by Şenol Mert Duman on 12.08.2023.
//

import Foundation

//ana protokoller
protocol ViewtoPresenterLeaguesVCProtocol{
    var interactor:PresentertoInteractorLeaguesVCProtocol? {get set}
    var view:PresentertoViewLeaguesVCProtocol? {get set}
    func getAllCompetitions()
}
protocol PresentertoInteractorLeaguesVCProtocol{
    var presenter:InteractortoPresenterLeaguesVCProtocol? {get set}
    func getCompetitions()
}
//tasiyici protokoller
protocol InteractortoPresenterLeaguesVCProtocol{
    func sendDatatoLeaguesVCPresenter(competitions:[Competitions])
}
protocol PresentertoViewLeaguesVCProtocol{
    func sendDatatoLeaguesVCView(competitions:[Competitions])
}
//Router
protocol PresentertoRouterLeaguesVCProtocol{
    static func createLeaguesVCModel(ref:LeaguesVC)
}
