//
//  CategorySVC.swift
//  ecommerce
//
//  Created by Vincent Salinas on 7/3/22.
//

import SwiftUI

struct CategorySVC: View {
    @EnvironmentObject var cartManager: CartManager
    @EnvironmentObject var historyManager: HistoryManager
    @EnvironmentObject var ordersManager: OrdersManager
    @EnvironmentObject var commentsManager: CommentsManager
    
    let columns: [GridItem] = [GridItem(.flexible())]
    var category: String
    
    var body: some View {
        VStack {
            NavigationBar()
                .environmentObject(cartManager)
                .environmentObject(ordersManager)
            NavigationBack()
            ScrollView {
                SignupModal()
                VStack(spacing: 20) {
                    CategoryHero()
                    CategoryFeatured(filteredProducts: CategoryViewModel.filterByCategory(targetCategory: category))
                        .environmentObject(cartManager)
                        .environmentObject(historyManager)
                        .environmentObject(ordersManager)
                        .environmentObject(commentsManager)
                    CategoryResults(filteredProducts: CategoryViewModel.filterByCategory(targetCategory: category))
                        .environmentObject(cartManager)
                        .environmentObject(historyManager)
                        .environmentObject(ordersManager)
                        .environmentObject(commentsManager)
                }
            }
        }
        .navigationTitle("")
        .navigationBarHidden(true)
    }
}

struct CategorySVC_Previews: PreviewProvider {
    static var previews: some View {
        CategorySVC(category: "headphones")
            .environmentObject(CartManager())
            .environmentObject(HistoryManager())
            .environmentObject(OrdersManager())
            .environmentObject(CommentsManager())
    }
}
