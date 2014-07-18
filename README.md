# Hashable2ple
Hashable tuple (2-tuple) struct in Swift

Dictionaries and tuples are awesome, but it'd be nice to be able to use a tuple as a key in a dictionary. Unfortunately, dictionary keys in Swift must adopt the Hashable protocol. Classes, structs, and enums can implement the Hashable protocol, but NOT tuples. Hashable2ple is a simple struct that implements the Hashable protocol. This isn't the only solution nor the best solution, but I hope it can useful to some.

### How to use Hashable2ple
- I would recommend using a typealias on the struct to shorten the name (create an alias of the specialized Hashable2ple type, since Hashable2ple makes use of generics)
- Both elements in Hashable2ple must also be hashable!
```swift
typealias NameAndAge = Hashable2ple<String, Int>
```
- Create a dictionary using the specialized Hashable2ple type
```swift
var dictionary: Dictionary<NameAndAge, Int> = Dictionary()
```
- Create a key
```swift
let kev = NameAndAge("Kev", 21)
```
- Finally, add the key-value pair to the dictionary!
```swift
dictionary(kev) = 1
```
