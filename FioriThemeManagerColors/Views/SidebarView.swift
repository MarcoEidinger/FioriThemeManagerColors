import FioriThemeManager
import SwiftUI

struct SidebarView: View {
    @Binding var paletteVersion: PaletteVersion

    @Binding var colorScheme: ColorScheme?

    @State private var selectedAppearance = 1

    var body: some View {
        Form {

            Section(header: Text("Color Palette")) {
                Picker("Flavor", selection: $paletteVersion) {
                    ForEach(PaletteVersion.allCases, id: \.self) { p in
                        Text(p.description)
                    }
                }
                .pickerStyle(.segmented)
            }

            Section(header: Text("Appereance")) {
                Picker(selection: $selectedAppearance, label: Text("Appearance")) {
                    Text("System").tag(1)
                    Text("Light").tag(2)
                    Text("Dark").tag(3)
                }
                .pickerStyle(.segmented)
                .onChange(of: selectedAppearance) { _ in
                    switch selectedAppearance {
                    case 1:
                        colorScheme = nil
                    case 2:
                        colorScheme = .light
                    case 3:
                        colorScheme = .dark
                    default:
                        break
                    }
                }
            }
            
            Link("View Design Guidelines", destination: URL(string: "https://experience.sap.com/fiori-design-ios/article/colors/")!)
        }
        .navigationTitle("Settings")
    }
}
