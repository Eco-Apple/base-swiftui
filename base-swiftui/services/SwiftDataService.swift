//
//  SwiftDataService.swift
//  MyMapDiary
//
//  Created by Jerico Villaraza on 10/18/24.
//

import SwiftData
import UIKit

@Model
class Model {
    
    init() {
        
    }
}

class SwiftDataService {
    private let modelContainer: ModelContainer
    private let modelContext: ModelContext
    
    @MainActor
    static let shared = SwiftDataService()
    
    @MainActor
    private init() {
        self.modelContainer = try! ModelContainer(for: Model.self, configurations: ModelConfiguration(isStoredInMemoryOnly: false))
        self.modelContext = modelContainer.mainContext
    }
    
    /* Model Sample */
    func getModels() -> [Model] {
        do {
            let models = try modelContext.fetch(FetchDescriptor<Model>())
            return models
        } catch {
            fatalError(error.localizedDescription)
        }
    }
    
    func addModel(_ model: Model) {
        do {
            modelContext.insert(model)
            
            try modelContext.save()
        } catch {
            fatalError(error.localizedDescription)
        }
    }
    
    func delModel(_ model: Model) {
        do {
            modelContext.delete(model)
            
            try modelContext.save()
        } catch {
            fatalError(error.localizedDescription)
        }
    }

}
