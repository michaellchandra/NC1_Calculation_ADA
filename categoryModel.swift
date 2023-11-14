//
//  categoryModel.swift
//  NC1_Calculation_ADA
//
//  Created by Michael Chandra on 11/05/23.
//

import Foundation


struct Category: Identifiable, Hashable{
    var id = UUID()
    var namaCategory:String
}

class CategoryViewModel: ObservableObject{
    
    
    var listCategoryArr:[Category] = [
        
        Category(namaCategory: "Red"),
        Category(namaCategory: "Green"),
        Category(namaCategory: "Blue"),
        Category(namaCategory: "Black"),
        Category(namaCategory: "Tartan")
        
    ]
}
