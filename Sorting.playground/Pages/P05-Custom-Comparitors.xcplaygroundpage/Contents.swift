import XCPlayground
let deck = Deck(comparator: suiteFirstComparator)
let (sceneView, scene) = CardSortScene.setupScene(deck)
/*:
 Don't worry about the code here – this sets up the deck of cards that we'll be manipulating, and the scene that displays it.
 */
//: [Previous](@previous)
/*:
 
 # Custom Comparators: Sorting by arbitrary properties
 
 So far we've only been sorting using the `value` property of the `Card` struct. But that's typically not how a fresh pack of cards is sorted by – it's typically sorted by _suite order_, then by _value_.
 
 Let's try to get our sort to do this too! We'll do it in such a way that separates the logic use to we compare cards, from the logic that sorts the cards.
 
 ## The approach
 
 We've given you a complete implementation of selection sort, but different in that it simply uses the `<` operator to compare two cards together. This typically wouldn't work in Swift since the Card type is a _struct_ and there isn't an inherent way to compare the value of two _structs_ together. But, Swift also allows you to implement custom operators! So here, we define a `<` function that takes in two Cards as parameters, and will allow us to use `<` if we complete it correctly!
 
 Right now, the `<` function always returns `true`, which isn't what we want. This means it always says the left (or `first`) card is _less than_ the right (or `second` card).
 
 - callout(Challenge): Modify the function so that it returns a `true` _if_ the left card is less than the right card and `false` if it should not! Make sure to use _suite order_ then _value_.
 
 - callout(Hint): You can retrieve the integer value of a _suite_ with `card.suite.rawValue`. The values for these will be between 0 and 3, in ascending suite order. Also we've given you a handy constant – `numCardsInSuite` that gives you the number of cards in each suite, `13`. You can use this to your advantage!
 
    Brainstorm with a partner to implement the _custom comparitor_ below! Remember, you want to sort by _suite_ and then by _value_.
 
    All the _clubs_ (`rawValue = 0`) are considered _less than_ all the _diamonds_ (`rawValue = 1`). All the _diamonds_ (`rawValue = 1`) are considered _less than_ all the _hearts_ (`rawValue = 2`). All the _hearts_ (`rawValue = 2`) are considered _less than_ all the _spades_ (`rawValue = 3`).
 
 */
let numCardsInSuite = 13

public func <(first: Card, second: Card) -> Bool {
    // Implement this!
    
    return true
}

extension Deck {
    public func selectionSort() {
        for index in 0...cards.count-2 {
            var lowestIndex = index
            for index in index+1...cards.count-1 {
                if cards[index] < cards[lowestIndex] {
                    lowestIndex = index
                }
            }
            swap(lowestIndex, index)
        }
    }
}
deck.selectionSort()
//: [Next](@next)
/*:
 Don't worry about this code. This takes the scene and deck information and displays it.
 */
sceneView.presentScene(scene);
XCPlaygroundPage.currentPage.liveView = sceneView;
