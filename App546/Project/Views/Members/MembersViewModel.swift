//
//  MembersViewModel.swift
//  App546
//
//  Created by IGOR on 06/05/2024.
//

import SwiftUI
import CoreData

final class MembersViewModel: ObservableObject {
    
    @AppStorage("Directions") var Directions: [String] = []
    @AppStorage("Jums") var Jums: [String] = []
    @Published var currentDir = ""
    @Published var currentJum = ""
    
    @Published var colors: [String] = ["blue", "red", "yellow", "green", "purple"]
    @Published var currentColor = ""
    
    @Published var days: [String] = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
    @Published var currentDay = ""
    
    @Published var isAdd: Bool = false
    @Published var isDelete: Bool = false
    @Published var isReset: Bool = false
    @Published var isDetail: Bool = false
    
    @Published var isGraph: Bool = false
    @Published var isCurrencies: Bool = false

    @Published var memName = ""
    @Published var memNumber = ""
    @Published var memDirections = ""

    @Published var members: [MembersModel] = []
    @Published var selectedMembers: MembersModel?

    func addMember() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "MembersModel", into: context) as! MembersModel

        loan.memName = memName
        loan.memNumber = memNumber
        loan.memDirections = memDirections

        CoreDataStack.shared.saveContext()
    }
    
    func fetchMembers() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<MembersModel>(entityName: "MembersModel")

        do {
            
            let result = try context.fetch(fetchRequest)
        
            self.members = result
            
        } catch let error as NSError {
            
            print("catch")
            
            print("Error fetching persons: \(error), \(error.userInfo)")
            
            self.members = []
        }
    }
    
}

