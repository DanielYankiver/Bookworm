//
//  RatingView.swift
//  Bookworm
//
//  Created by Daniel Yankiver on 12/30/23.
//

import SwiftUI

struct RatingView: View {
  @Binding var rating: Int

  var label = ""
  var maximaumRating = 5

  var offImage: Image?
  var onImage = Image(systemName: "star.fill")

  var offColor = Color.gray
  var onColor = Color.yellow


  var body: some View {
    HStack {
      if label.isEmpty == false {
        Text(label)
      }

      ForEach(1..<maximaumRating + 1, id: \.self) { number in
        Button {
          rating = number
        } label: {
          image(for: number)
            .foregroundStyle(number > rating ? offColor : onColor)
        }
      }
    }
    .buttonStyle(.plain)
  }

  func image(for number: Int) -> Image {
    if number > rating {
      offImage ?? onImage
    } else {
      onImage
    }
  }
}

#Preview {
  RatingView(rating: .constant(4))
}
