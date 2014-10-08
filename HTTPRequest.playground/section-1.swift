// Craig Schwerin
// 16 September 2014
// 
// HTTP Requester / Array Rotater

import Cocoa
import XCPlayground

var url = NSURL (string: "http://buckheit.com/smallestdata.txt")

XCPSetExecutionShouldContinueIndefinitely(continueIndefinitely: true)

func toArray (var str: String) -> [Int]
{
    var array = [Int]()
    
    for char in str
    {
        if (char != " ")
        {
            array.append((String(char)).toInt()!)
        }
    }
    
    return array
}

func rotate (var array: [Int], var offset: Int) -> [Int]
{
    var output = [Int](count: array.count, repeatedValue: 0)
    
    for var i = 0; i < array.count; ++i
    {
        let index = i + offset
        
        if (index < array.count)
        {
            output[index] = array[i]
        }
        else
        {
            index - array.count
            output[index - array.count] = array[i]
        }
    }
    
    return output
}

let task = NSURLSession.sharedSession().dataTaskWithURL(url!, completionHandler: { (data, response, error) -> Void in
    
    var returnedString = NSString (data: data, encoding: NSUTF8StringEncoding)
    
    var array = rotate(toArray(returnedString!), 1)
})

task.resume()

