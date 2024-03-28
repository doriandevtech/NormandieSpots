//
//  SettingsView.swift
//  NormandieSpots
//
//  Created by Dorian Emenir on 22/03/2024.
//

// MARK: Imports
import SwiftUI /// Imports SwiftUI framework

// MARK: SettingsView
/// Main aspect: SettingsView shows a list of settings to configure the app
struct SettingsView: View {
    
    //    MARK: Variables
    /// Bind the @State variable "setting" inside SettigsView
    @Binding var setting: Setting
    
    
    //    MARK: View
    /// SettingsView's view - contains a list of subviews for the settings of the app
    var body: some View {
        Slider(value: $setting.textSizeAsDouble, in: 1...10, step: 1) {
            Text("Slider")
        }
    }
}

// MARK: Preview
#Preview {
    SettingsView(setting: .constant(Setting.sampleData[0]))
}
