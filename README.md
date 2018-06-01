# HugeInt
A simple, pure swift library to help handling of huge int values (usually in incremental games). Upper limit is only the memory of the device. Value displaying: 1 = 1, 1000 = 1a, 1000000 = 1b etc... Supported operations: +, -, *, /, %, <<, >>. (Shifting shifts x digits which means multiplying or dividing by 1000ˆx,  eg: 1a << 1 = 1b)

## Installation
### CocoaPods
[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects. You can install it with the following command:

```bash
$ gem install cocoapods
```

To integrate HugeInt into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '10.0'
use_frameworks!

target 'MyApp' do
pod 'HugeInt', '~> 1.0'
end
```

Then, run the following command:

```bash
$ pod install
```

## Usage
### Createing a huge int 
```swift
// a == b == c == d == 50000
let a = HugeInt(with: 50000)
let b = HugeInt(with: (50, "a"))
let c = HugeInt(with: (50.0, "a"))
let d = HugeInt(with: [1:HugeDigit(position: 1, value: 50)], isNegative:false)
```
### Creating a huge digit
A HugeDigits is representing 1 digit of a HugeInt.

```swift
// a == b == 50000
let a = HugeDigit(position: 1 value:50)
let b = HugeDigit(with: "a", value:50)
```

### Operations
HugeInt conforms to [Comparable](https://developer.apple.com/documentation/swift/comparable) protocol, so supports to following operators: <, >, <=, >=, ==

Other supported operators: +, -, *, /, %, <<, >>

```swift
let a = HugeInt(with: 50000)
let b = HugeInt(with: (10, "a"))

var c = a + b
print("a + b = \(c.hugeIntValue)")
c = a - b
print("a - b = \(c.hugeIntValue)")
c = a * b
print("a * b = \(c.hugeIntValue)")
c = a / b
print("a / b = \(c.hugeIntValue)")
c = a % b
print("a % b = \(c.hugeIntValue)")
c = a << 2
print("a << 2 = \(c.hugeIntValue)")
c = a >> 1
print("a >> 1 = \(c.hugeIntValue)")
c = a.power(2)
print("a pow 2 = \(c.hugeDoubleValue)")
c = a.power((1,"a"))
print("a pow 1a = \(c.hugeDoubleValue)")

/**
The result:
a + b = (60, "a")   // 60.000
a - b = (40, "a")   // 40.000
a * b = (500, "b")  // 500.000.000
a / b = (5, "")     // 5
a % b = (0, "")     // 0
a << 2 = (50, "c")  // 50.000.000.000
a >> 1 = (50, "")   // 50
a pow 2 = (2.5, "c")// 25.000.000.000
a pow 1a = (9.33, "bhf") // 9.330.000.000.....
*/
```
