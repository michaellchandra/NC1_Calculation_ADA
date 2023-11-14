//
//  addTransactionView.swift
//  NC1_Calculation_ADA
//
//  Created by Michael Chandra on 08/05/23.
//

import SwiftUI

struct addTransactionView: View {
    @Environment(\.dismiss) var dismiss
    @Binding var money :Int
    //    @Binding var tanggal :String
    @State var selectTab = 0
    @State var tanggalTransaksi = Date()
    @State var jumlahTransaksi = 0
    @State var descTransaksi:String = ""
    @State var isClicked = false
    @State var choose = "Food"
//    @State var recentTransaction:Int
    
    let picker = ["Food", "Entertainment", "Shopping", "Transportation", "Investments", "Health", "Salary", "Unknown"]

    
    
//    @StateObject var categoryVM : CategoryViewModel
    @StateObject var transactionVM : TransaksiViewModel 
    

//    @State var category:CategoryViewModel
    var body: some View {
        NavigationStack{
            VStack{
                Picker("Select Transaction", selection: $selectTab) {
                    Text("Income").tag(0)
                    Text("Outcome").tag(1)
                }
                .pickerStyle(.segmented)
                .padding(16)
                
                
                //Deklarasi Switch Tampilan
                
                if (selectTab == 0){
                    VStack{
                        Text("Enter Amount")
                            .foregroundColor(.white)
                            .padding(.top,16)
                        
                        TextField("",value: $jumlahTransaksi, formatter: NumberFormatter())
                            .keyboardType(.numberPad)
                            
                            .textFieldStyle(.roundedBorder)
                            .padding(.leading,16)
                            .padding(.bottom, 16)
                            .padding(.trailing,16)
                            .font(.system(size: 36))
                            .fontWeight(.bold)
                            .multilineTextAlignment(.center)
                    }.background(Color.green)
                        .frame(width: .infinity, alignment: .center)
                    
                } else if (selectTab == 1){
                    VStack{
                        Text("Enter Amount")
                            .foregroundColor(.white)
                            .padding(.top,16)
                        
                        TextField("0",value: $jumlahTransaksi, formatter: NumberFormatter())
                            .keyboardType(.numberPad)
                        
                            .textFieldStyle(.roundedBorder)
                            .padding(.leading,16)
                            .padding(.bottom, 16)
                            .padding(.trailing,16)
                            .font(.system(size: 36))
                            .fontWeight(.bold)
                            .multilineTextAlignment(.center)
                    }.background(Color.red)
                        .frame(width: .infinity, alignment: .center)
                }
                
                
            }
            Form{
                
                HStack{
                    Picker("Select a category", selection: $choose) {
                        ForEach(picker, id: \.self) { value in
                            Text(value)
                        }
                    }
                    .pickerStyle(.menu)
                    
//                    Picker("Select a category", selection: $category) {
//                        ForEach(transactionVM.listCategoryArr.reversed(), id: \.self) { category in
//                            
//                            Text(String(category.namaCategory))
//                        }
//                    }
//                    .pickerStyle(.menu)

                }
                .background(.white)
                
                
                VStack {
                    Text("Choose Transaction Date")
                        .fontWeight(.bold)
                        .padding(.top,30)
                    DatePicker("Pilih Tanggal",selection: $tanggalTransaksi , displayedComponents: .date )
                        .datePickerStyle(.wheel)
                        .labelsHidden()
                        .padding(.horizontal)
                    
                }
                .background(Color.white)
                .cornerRadius(10)
                .padding()
                
                
                
                
            }
            .navigationTitle("Add Transaction")
            .background(Color(.systemGray6))
            .navigationBarTitleDisplayMode(.inline)
            .multilineTextAlignment(.trailing)
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Confirm", action: {
                        if (selectTab == 0){
                            money = money + jumlahTransaksi
                            
                            let newTransaction = Transaksi (jumlahUang: jumlahTransaksi, deskripsiTransaksi: descTransaksi, jenisTransaksi: String(selectTab), tanggalTransaksi: tanggalTransaksi.formatted(.dateTime.day().month().year()), categoryTransaksi: choose == nil ? "Food" : choose, pemasukan: true)
                            var mutableItemArr = transactionVM.transaksiArr
                            mutableItemArr.append(newTransaction)
                            
                            transactionVM.transaksiArr = mutableItemArr
                        } else {
                            money = money - jumlahTransaksi
                            
                            let newTransaction = Transaksi (jumlahUang: jumlahTransaksi, deskripsiTransaksi: descTransaksi, jenisTransaksi: String(selectTab), tanggalTransaksi: tanggalTransaksi.formatted(.dateTime.day().month().year()), categoryTransaksi: choose, pemasukan: false)
                            
                            var mutableItemArr = transactionVM.transaksiArr
                            mutableItemArr.append(newTransaction)
                            
                            transactionVM.transaksiArr = mutableItemArr
                        }
                        dismiss()
                    })
                }
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel", action: {
                        dismiss()
                    })
                }
            }
        }
    }
}

struct addTransactionView_Previews: PreviewProvider {
    static var previews: some View {
        addTransactionView()
    }
}


