//
//  Font+Extensions.swift
//  Spendific
//
//  Created by Pranav R on 26/06/24.
//

import SwiftUI

extension Font {
    static var subTexts: Font {
        Font.custom("Poppins-Regular", size: 12)
    }
    
    static var boldHeader: Font {
        Font.custom("Poppins-SemiBold", size: 50)
    }
    
    static var cardCatStyle: Font {
        Font.custom("Poppins-SemiBold", size: 18)
    }
    
    static var subHeader: Font {
        Font.custom("Poppins-Regular", size: 14)
    }
}
