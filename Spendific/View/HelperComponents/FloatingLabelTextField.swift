//
//  FloatingLabelTextField.swift
//  Spendific
//
//  Created by Pranav R on 30/06/24.
//

import SwiftUI

struct FloatingLabelTextField: View {
    // Environment Properties
    @Environment(\.colorScheme) private var colorScheme
    
    // View Properties
    var title: String
    @Binding var text: String
    @FocusState var isTextFieldFocused: Bool
    var placeholder: String?
    var type: TextFieldTypes = .String
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            Text(title)
                .font(.subHeader)
                .foregroundStyle(.secondary)
                .tracking(0.7)
                .hSpacing(.leading)
                .scaleEffect(isTextFieldFocused || !text.isEmpty || placeholder != nil  ? 0.8 : 1, anchor: .leading)
                .offset(y: isTextFieldFocused || !text.isEmpty || placeholder != nil ? -25 : 0)
                .animation(.easeInOut(duration: 0.1), value: isTextFieldFocused)
            
            if type == .String {
                TextField("", text: $text, axis: .vertical)
                    .font(.subHeader)
                    .focused($isTextFieldFocused)
                    .lineLimit(3)
                    .onChange(of: isTextFieldFocused) { focused in
                        if !focused && text.isEmpty {
                            withAnimation(.easeIn(duration: 0.1), {
                                isTextFieldFocused = false
                            })
                        }
                    }
            }
            
            if type == .Number {
                TextField(placeholder ?? "", text: $text)
                    .keyboardType(.decimalPad)
                    .font(.subHeader)
                    .focused($isTextFieldFocused)
                    .onChange(of: isTextFieldFocused) { focused in
                        if !focused && text.isEmpty {
                            withAnimation(.easeIn(duration: 0.1), {
                                isTextFieldFocused = false
                            })
                        }
                    }
            }
        }
        .padding(.top, isTextFieldFocused || !text.isEmpty || placeholder != nil ? 30 : 11.5)
        .padding(.bottom, 11.5)
        .padding(.horizontal, 15)
        .background(colorScheme == .light ? .lightGrayCustom : .gray.opacity(0.2), in: .rect(cornerRadius: 10))
        .animation(.easeInOut(duration: 0.1), value: isTextFieldFocused)
    }
}

#Preview {
    FloatingLabelTextField(title: "Title", text: .constant(""), placeholder: "Placeholder here")
}
