//
//  EditProfileContentView.swift
//  ToneUp
//
//  Created by 전준영 on 5/23/25.
//

import SwiftUI
import ComposableArchitecture
import PhotosUI

struct EditProfileContentView: View {
    
    @State private var photoItem: PhotosPickerItem?
    @Bindable var store: StoreOf<Profile>
    
    var body: some View {
        VStack(alignment: .leading,
               spacing: 12) {
            HStack(alignment: .center,
                   spacing: 12) {
                Group {
                    if let uiImage = store.selectedImage {
                        Image(uiImage: uiImage)
                            .resizable()
                    } else {
                        Image.color4
                            .resizable()
                    }
                }
                .frame(width: 80, height: 80)
                .clipShape(Circle())
                
                HStack(spacing: 4) {
                    CustomPhotoPicker(selectedItem: $photoItem,
                                      selectedImage: $store.selectedImage,
                                      isPresentedError: $store.isGalleryErrorPresented) {
                        CommonButton(
                            icon: nil,
                            backgroundColor: .white,
                            text: .editImage,
                            textColor: .black,
                            symbolColor: nil,
                            cornerRadius: 6,
                            font: .regular12,
                            borderColor: .profileBorder,
                            minWidth: 72,
                            height: 24,
                            isEnabled: false,
                            hasBorder: true,
                            hasInternalPadding: false
                        ) { }
                    }
                    
                    CommonButton(
                        icon: nil,
                        backgroundColor: .white,
                        text: .delete,
                        textColor: .black,
                        symbolColor: nil,
                        cornerRadius: 6,
                        font: .regular12,
                        borderColor: .profileBorder,
                        minWidth: 48,
                        height: 24,
                        hasBorder: true,
                        hasInternalPadding: false
                    ) {
                        
                    }
                }
                
                Spacer()
            }
            
        }
               .padding()
               .background(.white)
    }
    
}
