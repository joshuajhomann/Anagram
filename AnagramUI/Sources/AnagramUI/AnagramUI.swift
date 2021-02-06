import AnagramLogic
import Combine
import SwiftUI

public final class AnagramViewModel: ObservableObject {
  @Published public var word: String = ""
  @Published public private(set) var anagrams: [String] = []
  @Published public private(set) var isLoading = true
  public init() {

    let anagramService = AnagramService()

    anagramService
      .isLoading
      .receive(on: DispatchQueue.main)
      .assign(to: &$isLoading)

    $word
      .debounce(for: .seconds(0.25), scheduler: DispatchQueue.main)
      .receive(on: DispatchQueue.global(qos: .userInitiated))
      .map { word in
        guard word.count < 8 else { return ["Try a shorter word"] }
        let trimmed = String(word.trimmingCharacters(in: .whitespacesAndNewlines).prefix(7))
        return trimmed.isEmpty
          ? ["No anagrams found"]
          : anagramService.anagrams(for: trimmed)
      }
      .receive(on: DispatchQueue.main)
      .assign(to: &$anagrams)
  }
}

public struct AnagramView: View {
  @StateObject private var viewModel = AnagramViewModel()
  public var body: some View {
    if viewModel.isLoading {
      ProgressView()
    }
    else {
      VStack {
        TextField("Enter a word", text: $viewModel.word)
        List(viewModel.anagrams, id: \.self) { anagram in
          Text(anagram).font(.caption)
        }
      }
      .padding()
    }
  }
  public init() {}
}
