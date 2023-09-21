//
//  BottomSheetView.swift
//  BottomSheetDemo
//
//  Created by JD on 07/01/22.
//

import SwiftUI

struct BottomSheetView<Content: View>: View {
    
    @Binding var showBottomPopView: Bool
    var content: Content
    
    init(showBottomPop: Binding<Bool>, @ViewBuilder content: () -> Content) {
        _showBottomPopView = showBottomPop
        self.content = content()
    }
    
    var body: some View {
        VStack {
            Spacer()
            self.content
        }
        .ignoresSafeArea()
        .background(
            Color.black.opacity(0.3).ignoresSafeArea()
                .opacity(showBottomPopView ? 1 : 0)
                .onTapGesture(perform: {
                    withAnimation{ self.showBottomPopView.toggle() }
                }))
    }
}

struct BottomSheetView_Previews: PreviewProvider {
    @State static var showBottomPopView = false
    static var previews: some View {
        BottomSheetView(showBottomPop: $showBottomPopView) {
            Text("text")
        }
    }
}
