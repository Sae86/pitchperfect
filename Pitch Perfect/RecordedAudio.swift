//
//  RecordedAudio.swift
//  Pitch Perfect
//
//  Created by Sae on 9/14/15.
//  Copyright (c) 2015 Sae. All rights reserved.
//

import Foundation

class RecordedAudio: NSObject{
    
    var filePathUrl: NSURL!
    var title: String!
    
    init(filePathUrl: NSURL, title: String){
        self.filePathUrl = filePathUrl
        self.title = title
    }
}