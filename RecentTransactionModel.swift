//
//  RecentTransactionModel.swift
//  NC1_Calculation_ADA
//
//  Created by Michael Chandra on 09/05/23.
//

import Foundation

struct Transaksi: Identifiable, Hashable{
    var id = UUID()
    var jumlahUang:Int = 0
    var deskripsiTransaksi:String = ""
    var jenisTransaksi:String = ""
    var tanggalTransaksi = Date().formatted(.dateTime.day().month().year())
    var categoryTransaksi:String = "Food"
    var pemasukan : Bool = false
}

class TransaksiViewModel: ObservableObject{
    var transaksiArr: [Transaksi] = [
        //Transaksi(jumlahUang: <#T##Int#>, deskripsiTransaksi: <#T##String#>, jenisTransaksi: <#T##String#>, listCategory: <#T##[String]#>)
    ]
    
    
}




//class Transaksi: ObservableObject, Identifiable {
//    @Published var jumlahUang:Int = 0
//    @Published var deskripsiTransaksi:String
//    @Published var jenisTransaksi:String
//    @Published var tanggalTransaksi:Date
//    
//    init
//}
//
//class TransaksiList: ObservableObject {
//    @Published var transaksiList: [Transaksi] = []
//}
