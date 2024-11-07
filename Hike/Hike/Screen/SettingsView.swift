//
//  SettingsView.swift
//  Hike
//
//  Created by Bijoy A B on 06/11/24.
//

import SwiftUI

struct SettingsView: View {
    // MARK: - PROPERTIES
    
    private var alternateAppIcons : [String] = [
        "AppIcon-Backpack",
        "AppIcon-Camera",
        "AppIcon-Campfire",
        "AppIcon-MagnifyingGlass",
        "AppIcon-Map",
        "AppIcon-Mushroom"
    ]
    
    
    var body: some View {
        List{
            // MARK: - SECTION: HEADER
            Section {
                HStack{
                    Spacer()
                    Image(systemName: "laurel.leading")
                        .font(.system(size: 80, weight: .black))
                    VStack(spacing: -10) {
                        Text("Hike")
                            .font(.system(size: 66, weight: .black))
                        Text("Editor's Choice")
                    }
                    Image(systemName: "laurel.trailing")
                        .font(.system(size: 80, weight: .black))
                    Spacer()
                }
                .foregroundStyle(
                    LinearGradient(colors: [
                        .customGreenLight,
                        .customGreenMedium,
                        .customGreenDark
                    ],
                                   startPoint: .top,
                                   endPoint: .bottom
                    )
                )
                .padding(.top, 8)
                VStack(spacing: 8) {
                    Text("Where can you find \nperfect tracks?")
                        .font(.title2)
                        .fontWeight(.heavy)
                    Text("The hike which looks gorgeous in photos but is even better once you are actually there. The hike that you hope to do again someday. \nFind the best day hikes in the app")
                        .font(.footnote)
                        .italic()
                    Text("Dust off the boots! It's time for a walk")
                        .fontWeight(.heavy)
                        .foregroundColor(.customGreenMedium)
                }
                .multilineTextAlignment(.center)
                .padding(.bottom, 16)
                .frame(maxWidth: .infinity)

            } //: HEADER
            .listRowSeparator(.hidden)
            
            // MARK: - SECTION: ICONS
            
            Section(
                header: Text("Alternate Icons")
                
            ) {
                ScrollView(.horizontal, showsIndicators: false){
                    HStack(spacing: 12) {
                        ForEach(alternateAppIcons.indices, id: \.self) { item in
                            Button {
                                print("Icon \(alternateAppIcons[item]) was pressed")
                                
                                UIApplication.shared.setAlternateIconName(alternateAppIcons[item]) { error in
                                    if error != nil {
                                        print("Failed request to update app's icon: \(String(describing: error?.localizedDescription))")
                                    } else{
                                        print("Success! You have changed app's icon to \(alternateAppIcons[item])")
                                    }
                                    
                                }
                            } label: {
                                Image("\(alternateAppIcons[item])-Preview")
                                    .resizable()
                                    .frame(width: 80, height: 80)
                                    .cornerRadius(16)
                                    .scaledToFit()
                            }
                            .buttonStyle(.borderless)
                        }
                    }
                } //: SCROLL VIEW
                .padding(.top, 12)
                
                Text("Choose your favorite app icon from the collection above")
                    .font(.footnote)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding(.bottom, 12)
            } //: SECTION
            .listRowSeparator(.hidden)
            
            // MARK: - SECTION: ABOUT
            
            Section(
                header: Text("ABOUT THE APP"),
                footer: HStack{
                    Spacer()
                    Text("Copyright © All right reserved.")
                    Spacer()
                }
                    .padding(.vertical,8)
            ) {
                //: Basic Labled Content
               // LabeledContent("Application", value: "Hike")
                //: Advanced Labled Content
                CustomListRowView(rowLabel: "Application", rowIcon: "apps.iphone", rowContent: "HIKE", rowTintColor: .blue)
                CustomListRowView(rowLabel: "Compatibility", rowIcon: "info.circle", rowContent: "iOS, iPadOS", rowTintColor: .red)
                CustomListRowView(rowLabel: "Technology", rowIcon: "swift", rowContent: "Swift", rowTintColor: .orange)
                CustomListRowView(rowLabel: "Version", rowIcon: "gear", rowContent: "1.0", rowTintColor: .purple)
                CustomListRowView(rowLabel: "Developer", rowIcon: "ellipsis.curlybraces", rowContent: "Jone Doe", rowTintColor: .mint)
                CustomListRowView(rowLabel: "Designer", rowIcon: "paintpalette", rowContent: "Bijoy", rowTintColor: .pink)

                CustomListRowView(rowLabel: "Website", rowIcon: "globe", rowTintColor: .indigo, rowLinkLabel: "Bijoy Arikkatt", rowLinkDestination: "https://bijoyarikkatt.com")
            }
        }//: LIST
        
    }
}

#Preview {
    SettingsView()
}
