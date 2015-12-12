//
//  Politician.swift
//  Vedor
//
//  Created by Jaison Vieira on 12/12/15.
//  Copyright © 2015 hackpuck. All rights reserved.
//

import UIKit
import Parse

class Politician: NSObject {
    
    enum ParseField: String {
        case PoliticianName = "nome_candidato", PoliticianNumber = "numero_candidato",
        PoliticianYear = "ano_eleicao", PoliticianLegend = "composicao_legenda",
        PoliticianCpf = "cpf_candidato", PoliticianTurn = "num_turno",
        PoliticianPartyNumber = "numero_partido", PoliticianUf = "sigla_uf",
        PoliticianRole = "descricao_cargo", PoliticianUrn = "nome_urna_candidato",
        PoliticianPartyName = "nome_partido", PoliticianDescTurn = "desc_sit_tot_turno",
        PoliticianEmail = "email", PoliticianPartyInit = "sigla_partido"
    }
    
    var candidateName: String!
    var candidateNumber: String!
    var electionYear: String!
    var compositionLegend: String!
    var candidateDocumentNumber: String!
    var turnNumber: String!
    var candidatePartyNumber: String!
    var candidateUf: String!
    var candidateRole: String!
    var candidateUrnName: String!
    var candidatePartyName: String!
    var candidateTurnDescription: String!
    var candidateEmail: String!
    var candidatePartyInitials: String!
    
    init(parseObject: PFObject) {
        candidateName = parseObject[ParseField.PoliticianName.rawValue] as? String
        candidateNumber = parseObject[ParseField.PoliticianNumber.rawValue] as? String
        electionYear = parseObject[ParseField.PoliticianYear.rawValue] as? String
        compositionLegend = parseObject[ParseField.PoliticianLegend.rawValue] as? String
        candidateDocumentNumber = parseObject[ParseField.PoliticianCpf.rawValue] as? String
        turnNumber = parseObject[ParseField.PoliticianTurn.rawValue] as? String
        candidatePartyNumber = parseObject[ParseField.PoliticianPartyNumber.rawValue] as? String
        candidateUf = parseObject[ParseField.PoliticianUf.rawValue] as? String
        candidateRole = parseObject[ParseField.PoliticianRole.rawValue] as? String
        candidateUrnName = parseObject[ParseField.PoliticianUrn.rawValue] as? String
        candidatePartyName = parseObject[ParseField.PoliticianPartyName.rawValue] as? String
        candidateTurnDescription = parseObject[ParseField.PoliticianDescTurn.rawValue] as? String
        candidateEmail = parseObject[ParseField.PoliticianEmail.rawValue] as? String
        candidatePartyInitials = parseObject[ParseField.PoliticianPartyInit.rawValue] as? String
    }

}
