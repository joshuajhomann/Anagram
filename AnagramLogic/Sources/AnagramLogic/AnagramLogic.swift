import Algorithms
import Combine
import Foundation
import PrefixTrie

public final class AnagramService {
  public var isLoading: AnyPublisher<Bool, Never> {
    Just(false).eraseToAnyPublisher()
  }

  public func anagrams(for word: String) -> [String] {
    Array(Set(
      word
        .lowercased()
        .permutations()
        .map(String.init(_:))
        .filter(dictionary.contains(_:))
    ))
  }


  private var dictionary = PrefixTrie.PrefixTree<String>()
  private var subscriptions = Set<AnyCancellable>()
  public init() {
    PrefixTrie
      .PrefixTree<String>.makeDictionary()
      .assertNoFailure()
      .receive(on: DispatchQueue.main)
      .assign(to: \.dictionary, on: self)
      .store(in: &subscriptions)
  }
}
