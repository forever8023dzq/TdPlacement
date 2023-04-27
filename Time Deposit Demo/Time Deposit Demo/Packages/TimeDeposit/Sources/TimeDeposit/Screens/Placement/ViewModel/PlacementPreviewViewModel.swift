//
//  PlacementPreviewViewModel.swift
//  
//
//  Created by Apple on 2023/4/21.
//

import Foundation

public final class PlacementPreviewViewModel {
    
    
    public private(set) var state: Observable<PlacementStatte> = Observable(.none)
    public var amount: Observable<Double> = Observable(0)
    
    init() {
        
    }
    
    func placementPreview(){
        debugPrint("placementPreview")
    }
}
