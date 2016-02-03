[![Build Status](https://img.shields.io/travis/GabrielMassana/ios-code-test/master.svg?style=flat-square)](https://travis-ci.org/GabrielMassana/ios-code-test)

# ios-code-test

## How and why

#### Using my own pods from Cocoapods.

I used two of [my own pods in Cocoapods](https://cocoapods.org/owners/10374).   
   
- **CoreDataFullStack**. A project to simplify the use of Core Data.
- **CoreOperation**. Small wrapper project to simplify `NSOperation` and `NSOperationQueue`.
	
#### Third party pods from Cocoapods.

I used **[PureLayout](https://cocoapods.org/?q=purelayout)**, an easy and powerfull pod that helps a lot using autolayout.

#### NSUInteger only.

The specifications said to calculate the maximum possible **F(n)** based on `NSUInteger`.

As you can check [here](https://itunes.apple.com/gb/app/pisano-period-fibonacci-series/id782643905?mt=8), I created an app two years ago to calculate Fibonacci and Pisano Period. 

On that time I wanted to calculate any **F(n)**, so I used [this](https://cocoapods.org/?q=JKBigInteger) pod created by *Janis Kirsteins*. 

#### Calculating only once

I decided to store the **F(n)** in core data. With this decission  I only need to calculate the Fibonacci sequence once, saving CPU for other tasks.

Also, with Core Data, I used a `FetchResultController` to atomatically update the `TableView`.

It is convined with an FRC and a Table View, when Core Data is more powerfull.

#### Other possible approach.

The other possible approach was to calculate the **F(n)** while scrolling the table view. Easy to do because was easy to calculate in this way: **F(row)**. The idea behind this approach will be to create a new operation for every new **F(row)**. 

The major problem with this approach is to know in advance the total number of rows in the table view. So, it will require more logic on top of the Table View. Totally unnecessary when we can use an FRC. Also the usage of the CPU will be more intensive.


#### Why not recursive approach?

To calculate the Fibonacci sequence there is the possibility to create a recursive function. Easier for the developer but less performant for the CPU.

#### NSOperation, not GCD

I used `NSOperation` and `NSOperationQueue` to handle the calculation of the Fibonacci sequence in a background Thread. 

NSOperation was build by Apple on top of `Grand Central Dispatch`. GCD is a lower level C based API. While `NSOperation` is a highest level of abstraction and it is OP based. So, in general, better than GCD.

#### CI

I added Continuous Integration to the project with [Travis-CI](https://travis-ci.org/GabrielMassana/ios-code-test). No Unit Tests on the project, but at least, we can know if the project compiles or not. Really helpful.

## What to do

We'd like you to create a very simple app:
> Calculate and display each Fibonacci number from 1 -> max n possible on an iPhone with unsigned integers, and display each f(n) in a table view.  The UITableView scrolling MUST remain smooth.

Note: The formula for calculating the n'th term in a Fibonacci sequence is:
>f(n) = f(n-1) + f(n-2)

It should be written using Objective-C and XCode. Use any open source libraries or frameworks you think you need. It's ok just to target any iPhone device.
Please don't spend more than 3 hours on it, even if it's not working flawleslly. We're looking for how you think and how you structure your app.

## Submission

Please fork this repository, write some code and update this README with any relevant detail.
