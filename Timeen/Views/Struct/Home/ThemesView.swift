//
//  ThemesView.swift
//  Timeen
//
//  Created by Leonardo on 27/02/24.
//

import SwiftUI

struct ThemesView: View {
    @EnvironmentObject private var authenticationVM: AuthenticationViewModel
    @EnvironmentObject private var isLoadingVM: IsLoadingViewModel
    
    @Environment(\.dismiss) private var dismiss
    
    @State private var themes: [Theme] = []
    
    let columns = Array(repeating: GridItem(.flexible()), count: 2)
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 10) {
                ForEach(Theme.allCases, id: \.self) { theme in
                    ThemeMenuButton(theme: theme)
                }
            }
            .padding(.horizontal, 7)
        }
        .background(Color(.background))
        .navigationTitle("Temáticas")
        .navigationBarBackButtonHidden()
        .onAppear(perform: onAppear)
        .toolbar {
            if authenticationVM.account.themes != themes {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Guardar", action: saveChanges)
                }
            }
            
            ToolbarItem(placement: .topBarLeading) {
                Button("Cancelar", action: cancelChanges).foregroundStyle(.red)
            }
        }
    }
    
    private func onAppear() {
        themes = authenticationVM.account.themes
    }
    
    private func saveChanges() {
        withAnimation {
            isLoadingVM.isLoading = true
            Task {
                let result = await AccountViewModel().update(authenticationVM.account)
                
                switch result {
                    case .success(let account):
                        authenticationVM.account = account
                    case .failure(let error):
                        print(error.localizedDescription)
                }
                dismiss()
                isLoadingVM.isLoading = false
            }
        }
    }
    
    private func cancelChanges() {
        withAnimation {
            dismiss()
        }
    }
}

struct ThemeMenuButton: View {
    @EnvironmentObject private var authenticationVM: AuthenticationViewModel
    @State var selected: Bool = false
    let theme: Theme
    
    var body: some View {
        Button(action: buttonPressed) {
            HStack {
                Image(systemName: theme.icon).foregroundStyle(selected ? .white : theme.color)
                Text(theme.title).bold().foregroundStyle(selected ? .white : theme.color.darker())
                Spacer()
            }
            .frame(maxWidth: .infinity)
            .frame(height: 60)
            .padding(.leading, 7)
            .background(selected ? theme.color : .white)
            .clipShape(.rect(cornerRadius: 20))
            .shadow(radius: 3)
        }
        .onAppear(perform: onAppear)
    }
    
    private func buttonPressed() {
        if authenticationVM.account.themes.contains(theme) {
            authenticationVM.account.themes.removeAll { $0 == theme }
            selected = false
        } else {
            authenticationVM.account.themes.append(theme)
            selected = true
        }
    }
    
    private func onAppear() {
        if authenticationVM.account.themes.contains(theme) {
            selected = true
        }
    }
}

#Preview {
    NavigationStack {
        ThemesView()
            .environmentObject(AuthenticationViewModel())
    }
}
