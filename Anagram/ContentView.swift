//
//  ContentView.swift
//  Anagram
//
//  Created by Joshua Homann on 2/3/21.
//

import AnagramUI
import SwiftUI

struct ContentView: View {
  var body: some View {
    AnagramView()
      .textFieldStyle(RoundedBorderTextFieldStyle())
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
