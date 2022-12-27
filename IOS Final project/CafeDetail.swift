//
//  CafeDetail.swift
//  IOS Final project
//
//  Created by User11 on 2022/12/27.
//

import SwiftUI

struct CafeDetail: View {
    var name: String
    var city: String
    let cheap: Double
    let address: String
    let wifi: Double
    let socket: String
    let open_time: String
    let limited_time: String
//    @Binding var index: Int
    var body: some View {
        List{
            Section{
                Text("店名")
                Text(name)
            }
            Section{
                Text("城市")
                Text(city)
            }
            Section{
                Text("地址")
                Text(address)
            }
//            Text(cheap)
            
//            Text(wifi)
//            Text(socket)
//            Text(open_time)
//            Text(limited_time)
        }
        .listStyle(GroupedListStyle())
    }
}

//struct CafeDetail_Previews: PreviewProvider {
//    static var previews: some View {
//        CafeDetail()
//    }
//}
