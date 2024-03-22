//
//  SettingsView.swift
//  NormandieSpots
//
//  Created by Dorian Emenir on 22/03/2024.
//

import SwiftUI

struct SettingsView: View {
    @Binding var setting: Setting

    var body: some View {
//        List {
            Slider(value: $setting.textSizeAsDouble, in: 1...10, step: 1) {
                Text("Slider")
//            }
        }
    }
}

#Preview {
    SettingsView(setting: .constant(Setting.sampleData[0]))
}
