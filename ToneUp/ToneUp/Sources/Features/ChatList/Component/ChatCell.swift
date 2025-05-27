//
//  ChatCell.swift
//  ToneUp
//
//  Created by 전준영 on 5/26/25.
//

import SwiftUI

struct ChatCell: View {
    
    let room: ChatRoom
    
    var body: some View {
        HStack(spacing: 16) {
            Circle()
                .fill(.black)
                .frame(width: 48, height: 48)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(room.name)
                    .font(.headline)
                
                Text(room.lastMessage)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .lineLimit(1)
            }
            
            Spacer()
            
            VStack(alignment: .trailing,
                   spacing: 4) {
                if !room.lastDate.isEmpty {
                    Text(room.lastDate)
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                
                if room.unreadCount > 0 {
                    Text("\(room.unreadCount)")
                        .font(.caption2)
                        .foregroundColor(.white)
                        .padding(6)
                        .background(Circle().fill(.red))
                }
            }
        }
        .padding(.vertical, 12)
    }
    
}
