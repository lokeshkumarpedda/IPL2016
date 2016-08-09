//
//  ParsingData.swift
//  IPL2016
//
//  Created by BridgeLabz on 03/08/16.
//  Copyright © 2016 BridgeLabz. All rights reserved.
//

import UIKit
import Firebase

class ParsingData: NSObject {
    
    func parsingTeamData(snapshot : FIRDataSnapshot) {
        let dataDictionary = snapshot.value as! [NSDictionary]
        TeamNamesTable().gettingParsedData(dataDictionary)
    }
}
//        let storageAddress = FIRStorage.storage().reference()
//        let storage = storageAddress.child("/Teams/Logos/DD.jpg")
//        print("====")
//        print(storage)
//        storage.dataWithMaxSize(1 * 1024 * 1024){ (data, error) -> Void in
//            if (error != nil){
//                print("network failed")
//            }else{
//                self.view.backgroundColor = UIColor(patternImage: UIImage(data: data!)!)
//            }
//        }