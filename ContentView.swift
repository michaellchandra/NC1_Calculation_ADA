//
//  ContentView.swift
//  NC1_Calculation_ADA
//
//  Created by Michael Chandra on 08/05/23.
//

import SwiftUI

struct ContentView: View {
    @State var totalBalance = 0
    @State var showSheet = false
    @Environment(\.dismiss) var dismiss
    @State var tanggalTransaksi = Date()
    
    //    @State var selectCategory:String = "food"
    
    var recentTransaction: [Transaksi] = []
    @StateObject var transactionVM : TransaksiViewModel
    @EnvironmentObject var newTransaction : TransaksiViewModel
    @StateObject var categoryVM : CategoryViewModel
    
    
    func formatNumber(_ number: Int) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        
        if let formattedNumber = formatter.string(from: NSNumber(value: number)) {
            return formattedNumber
        }
        
        return "\(totalBalance)"
    }
    
    func imageCategory(category: String) -> some View {
        
     
        switch (category){
        case "Food":
            return Image(systemName: "fork.knife.circle.fill")
                .resizable()
                .frame(width: 50, height: 50)
        case "Entertainment":
            return Image(systemName: "popcorn.circle.fill")
                .resizable()
                .frame(width: 50, height: 50)
        case "Shopping":
            return Image(systemName: "bag.circle.fill")
                .resizable()
                .frame(width: 50, height: 50)
        case "Transportation":
            return Image(systemName: "car.circle.fill")
                .resizable()
                .frame(width: 50, height: 50)
        case "Investments":
            return Image(systemName: "chart.line.uptrend.xyaxis.circle.fill")
                .resizable()
                .frame(width: 50, height: 50)
        case "Health":
            return Image(systemName: "stethoscope.circle.fill")
                .resizable()
                .frame(width: 50, height: 50)
        case "Salary":
            return Image(systemName: "dollarsign.circle.fill")
                .resizable()
                .frame(width: 50, height: 50)
        default:
            return Image(systemName: "questionmark.circle.fill")
                .resizable()
                .frame(width: 50, height: 50)
        }
        
    }

    var body: some View {
        
        NavigationStack{
            ScrollView{
                VStack {
                    
                    VStack{
                        Text("Total Balance")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.top,10)
                        
                        Text("IDR " + (formatNumber(totalBalance)))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.system(size: 30,weight: .bold))
                        
                            .padding(.bottom,6)
                    }
                    .foregroundColor(.white)
                    .background(
                        Image("01_TotalBalance-Blue_360x100")
                            .resizable()
                            .frame(width: 360, height: 100)
                    )
                    .frame(width: 330, height: 100)
                    
                    
                    HStack{
                        Text("Recent Transaction")
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Button("Add"){
                            showSheet.toggle()
                        }.sheet(isPresented: $showSheet){
                            
//                            addTransactionView(money: $totalBalance, transactionVM: transactionVM)
                            
                            
                            
                        }
                        
                    }
                    .padding(.top,24.0)
                    
                    ScrollView{
                        VStack {
                            
                            
                            ForEach(transactionVM.transaksiArr.reversed(), id: \.self) { transaction in
                                
                                
                                if (transaction.pemasukan) {
                                    VStack{
                                        
                                        HStack{
                                            //IF Statement Icon Category
                                            imageCategory(category: transaction.categoryTransaksi)

                                            Text(String(transaction.categoryTransaksi))
                                            Text(("+IDR ") + formatNumber(transaction.jumlahUang))
                                                .frame(maxWidth: .infinity, alignment: .trailing)
                                                .font(.system(size: 20, weight: .bold))
                                                .foregroundColor(Color.green)
                                        }
                                        VStack{
                                            Text(String(transaction.tanggalTransaksi))
                                                .frame(maxWidth: .infinity, alignment: .trailing)
                                                .font(.system(size: 12))
                                        }
                                    }
                                    .padding()
                                    .background(Color.white)
                                    .cornerRadius(6)
                                    
                                    
                                } else {
                                    VStack{
                                        
                                        HStack{
                                            imageCategory(category: transaction.categoryTransaksi)
                                            Text(String(transaction.categoryTransaksi))
                                            Text(("-IDR ") + formatNumber(transaction.jumlahUang))
                                                .frame(maxWidth: .infinity, alignment: .trailing)
                                                .font(.system(size: 20, weight: .bold))
                                                .foregroundColor(Color.red)
                                        }
                                        VStack{
                                            Text(String(transaction.tanggalTransaksi))
                                                .frame(maxWidth: .infinity, alignment: .trailing)
                                                .font(.system(size: 12))
                                        }
                                    }
                                    .padding()
                                    .background(Color.white)
                                    .cornerRadius(6)
                                    
                                }
                                
                            }
                        }
                        
                    }
                    
                    
                }
                
                
                .padding()
            }
            .navigationTitle("Dashboard")
            .background(Color(.systemGray6))
        }
        
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(transactionVM: TransaksiViewModel(), categoryVM: CategoryViewModel())
    }
}
