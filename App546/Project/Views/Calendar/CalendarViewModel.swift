//
//  CalendarViewModel.swift
//  App546
//
//  Created by IGOR on 06/05/2024.
//

import SwiftUI
import CoreData

final class CalendarViewModel: ObservableObject {
    
    @Published var colors: [String] = ["blue", "red", "yellow", "green", "purple"]
    @Published var currentColor = ""
    
    @Published var days: [String] = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
    @Published var currentDay = ""
    
    @Published var isAdd: Bool = false
    @Published var isDelete: Bool = false
    @Published var isReset: Bool = false
    @Published var isDetail: Bool = false
    @Published var isMore: Bool = false
    
    @AppStorage("Directions") var Directions: [String] = []
    @AppStorage("Jums") var Jums: [String] = []
    @Published var currentDir = ""
    @Published var currentJum = ""

    @Published var clDirection = ""
    @Published var clName = ""
    @Published var clJumVenue = ""
    @Published var clPrice = ""
    @Published var clDayWeek = ""
    @Published var clStartTime = ""
    @Published var clEndTime = ""
    @Published var clColor = ""


    @Published var classes: [ClassModel] = []
    @Published var selectedClass: ClassModel?
    
    func fetchClassesMonday() -> [ClassModel] {
        
        return classes.filter{($0.clDayWeek ?? "") == "Monday"}
    }
    
    func fetchClassesTuesday() -> [ClassModel] {
        
        return classes.filter{($0.clDayWeek ?? "") == "Tuesday"}
    }
    
    func fetchClassesWednesday() -> [ClassModel] {
        
        return classes.filter{($0.clDayWeek ?? "") == "Wednesday"}
    }
    
    func fetchClassesThursday() -> [ClassModel] {
        
        return classes.filter{($0.clDayWeek ?? "") == "Thursday"}
    }
    
    func fetchClassesFriday() -> [ClassModel] {
        
        return classes.filter{($0.clDayWeek ?? "") == "Friday"}
    }
    
    func fetchClassesSaturday() -> [ClassModel] {
        
        return classes.filter{($0.clDayWeek ?? "") == "Saturday"}
    }
    
    func fetchClassesSunday() -> [ClassModel] {
        
        return classes.filter{($0.clDayWeek ?? "") == "Sunday"}
    }

    func addClass() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "ClassModel", into: context) as! ClassModel

        loan.clDirection = clDirection
        loan.clName = clName
        loan.clJumVenue = clJumVenue
        loan.clPrice = clPrice
        loan.clDayWeek = clDayWeek
        loan.clStartTime = clStartTime
        loan.clEndTime = clEndTime
        loan.clColor = clColor

        CoreDataStack.shared.saveContext()
    }
    
    func fetchClasses() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<ClassModel>(entityName: "ClassModel")

        do {
            
            let result = try context.fetch(fetchRequest)
        
            self.classes = result
            
        } catch let error as NSError {
            
            print("catch")
            
            print("Error fetching persons: \(error), \(error.userInfo)")
            
            self.classes = []
        }
    }
    
}

