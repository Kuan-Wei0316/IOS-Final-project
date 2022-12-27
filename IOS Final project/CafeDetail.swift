//
//  CafeDetail.swift
//  IOS Final project
//
//  Created by User11 on 2022/12/27.
//

import SwiftUI

struct CafeDetail: View {
    @Binding var cafeResult: CafeResult
    @Binding var index: Int
    var body: some View {
        Text(cafeResult.data[index].name)
    }
}

//struct CafeDetail_Previews: PreviewProvider {
//    static var previews: some View {
//        CafeDetail()
//    }
//}
