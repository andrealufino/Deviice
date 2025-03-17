![Logo](Deviice.png)

## Version 3

⚠️**Note that this version contains breaking changes, do not update before checking the new library!**.⚠️

Version 3 has been rewritten with one purpose in mind: be simple. Simple to use and simple to update, as version 2 was offering some interesting structures, but was a pain to update.
This version removed all classes except two, that are `Device` and `Model`, and introduced a `json` file to update when new devices are out. All the properties are now raw types, except for `specificModel` that is a computed property that returns a value of type `Model`.
Cocoapods has been removed, following the pattern that most open source libraries are doing (for several years). 

## Usage

There is documentation for all the classes, methods and properties in the code. 
To give a general idea, this is how things work. 

```swift
let device = Device.init()  // This instantiate a `Device` object based on the current device.

print(device.marketingName)   // This prints "iPhone 16 Pro" in case it is running on an iPhone 16 Pro

```

There is also the possibility to get the actual device being simulated on a Mac. 

```swift
let device = Device.init()

print(device.marketingName)                      // This will print "Simulator".
print(device.simulatedDevice?.marketingName)     // This will print "iPhone 16 Pro" in case you're simulating an iPhone 16 Pro.
```

## Add new devices

To add new devices there's just one thing that is a must: update the json. There's a nice to do step that is to update also the `Model` enumeration with the new model. This allows to have the property `specificModel` return a `Model`. Otherwise, it will return `.notMapped` and the value of the new model will be present in the `specificModelRaw` property as a `String`. 
So, to summarize, the steps are:

1. Add the new device(s) to the json following the current structure.
2. Add the new models to the `Model` enum assuring that they're named the same as the `specificModelRaw` key in the json.

## Requirements
 
This library works on iOS 15 or higher.

## Installation

Deviice is available through Swift Package Manager.

### Swift Package Manager

You can add this library via Swift Package Manager, using this url `https://github.com/andrealufino/Deviice`.

## Author

Andrea Mario Lufino, [andrealufino.com](https://andrealufino.com). Thanks to all the contributors.

## License

Deviice is available under the MIT license. See the LICENSE file for more info.
