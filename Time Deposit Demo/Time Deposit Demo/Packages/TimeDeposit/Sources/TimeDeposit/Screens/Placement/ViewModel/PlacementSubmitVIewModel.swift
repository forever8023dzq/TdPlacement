//
//  PlacementSubmitVIewModel.swift
//  
//
//  Created by Apple on 2023/4/22.
//


import Foundation

public final class PlacementSubmitVIewModel {
    
    
    public private(set) var state: Observable<PlacementStatte> = Observable(.none)
    public var amount: Observable<Double> = Observable(0)
    
    init() {
        
    }
    
    func placementSubmit(){
        debugPrint("placementSubmit")
    }
}
