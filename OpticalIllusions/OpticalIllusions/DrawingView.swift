//
//  DrawingView.swift
//
//  Created by Vimal V. with help from Harsh M. on 11/29/23.
//    with minor modifications and documentation by Mr. Bunn

import UIKit

/// This UIView subclass demonstrates how to add custom drawing code to a UIView
///  via overriding the draw(_ rect : CGRect) function
class DrawingView : UIView {
    
    //feel free to use these screen dimension variables!
    //accessible from anywhere, totally free of charge
    let screenWidth  = Int(UIScreen.main.bounds.width)
    let screenHeight = Int(UIScreen.main.bounds.height)
    
    ///overriding this method allows you to add custom drawing code to a UIView
    ///drawing you do in this function or *from* this method will show up on the view this file is attached to
    ///call your other drawing functions from here (e.g. `gradientIllusion()`)
    override func draw(_ rect : CGRect) {
        /*
         option + click the functions below to view their documentation
         */
        //drawLine(100, 100, 300, 300)
        //drawRectangle(50, 200, width: 100, height: 100)
        //drawCircle(300, 100, radius:  25)
        //drawOval(100, 500, width: 100, height: 50)
        //drawGradient(200, 350, width: 100, height: 50, colors: [UIColor.white, UIColor.black])
        
        /*
         * TODO: call your drawing functions below and they will be rendered on the view this class is attached to
         */
        //gradientIllusion()
        //curvingSquares()
        //herringsIllusion()
        //eisensteinsIllusion()
        //hermannScintillatingGridIllusion()
        //cafeWallIllusion()
        ebbinghausIllusion()
    }
    
    /*
     TODO: Create your functions to create the optical illusions and call them from draw(_ rect : CGRect)
     */
    func gradientIllusion() {
        drawGradient(0, 0, width: screenWidth, height: screenHeight, colors: [UIColor.darkGray, UIColor.gray, UIColor.lightGray])
        drawRectangle(50, 200, width: 300, height: 300, color: UIColor.gray, fill: true)
            
    }
    
    func curvingSquares() {
        let seq = stride(from: 10, to: 500, by: 5)
        var wid = 0.1
        for index in seq {
            drawCircle(screenWidth/2, screenHeight/2, radius: index, lineWidth: CGFloat(wid))
            wid += 0.05
        }
        
        drawRectangle(screenWidth/2 - 150, screenHeight/2 - 150, width: 300, height: 300, color: UIColor.purple, lineWidth: CGFloat(10))
        drawRectangle(screenWidth/2 - 100, screenHeight/2 - 100, width: 200, height: 200, color: UIColor.purple, lineWidth: CGFloat(5))
        drawRectangle(screenWidth/2 - 50, screenHeight/2 - 50, width: 100, height: 100, color: UIColor.purple, lineWidth: CGFloat(2))
    }
    
    func herringsIllusion() {
        drawLine(screenWidth/2 - 50, 0, screenWidth/2 - 50, screenHeight, color: UIColor.red)
        drawLine(screenWidth/2 + 50, 0, screenWidth/2 + 50, screenHeight, color: UIColor.red)
        
        var size = 600.0
        
        for index in 0...50 {
            drawLine(screenWidth/2, 
                     screenHeight/2,
                     screenWidth/2 + Int(size * cos(Double.pi/25.0 * Double(index))),
                     screenHeight/2 + Int(size * sin(Double.pi/25.0 * Double(index))))
        }
    }
    
    func eisensteinsIllusion() {
        var size = 600.0
        
        for index in 0...50 {
            drawLine(screenWidth/2,
                     screenHeight/2,
                     screenWidth/2 + Int(size * cos(Double.pi/25.0 * Double(index))),
                     screenHeight/2 + Int(size * sin(Double.pi/25.0 * Double(index))))
        }
        
        drawRectangle(screenWidth/2 + 50, screenHeight/2 - 50, width: 100, height: 100, color: UIColor.red)
        drawCircle(screenWidth/2 - 100, screenHeight/2, radius: 60, color: UIColor.red)
    }
     
    func hermannScintillatingGridIllusion() {
        drawRectangle(0, 0, width: screenWidth, height: screenHeight, color: UIColor.gray, fill: true)
        
        let width = stride(from: 20, to: screenWidth - 60, by: 60)
        let height = stride(from: 50, to: screenHeight - 60, by: 60)
        
        for h in height {
            for w in width {
                drawRectangle(w, h, width: 50, height: 50, fill: true)
                if (w == (screenWidth - 60) || h == (screenHeight - 60)) {
                    break;
                }
                drawCircle(w + 55, h + 55, radius: 5, color: UIColor.white, fill: true)
            }
        }
    }
    
    func cafeWallIllusion() {
        var dimen = screenHeight / 18
        var checker : Bool = false
        
        let lines = stride(from: 0, to: screenHeight, by: dimen)
        let width = stride(from: 10, to: screenWidth - 10, by: 120)

        for squares in lines {
            for w in width {
                if (checker) {
                    drawRectangle(w, squares, width: 60, height: dimen, color: UIColor.black, fill: true)
                }
                else {
                    drawRectangle(w + 30, squares, width: 60, height: dimen, color: UIColor.black, fill: true)
                }
            }
            checker.toggle()
        }
        
        for height in lines {
            drawLine(0, height, screenWidth, height, lineWidth: 4.0, color: UIColor.gray)
        }
    }
    
    func ebbinghausIllusion() {
        //Draw orange circles
        drawCircle(screenWidth/2 - 80, screenHeight/2, radius: 20, color: UIColor.orange, fill: true)
        drawCircle(screenWidth/2 + 100, screenHeight/2, radius: 20, color: UIColor.orange, fill: true)
        
        //Draw large blue circles
        drawCircle(screenWidth/2 - 150, screenHeight/2, radius: 30, color: UIColor.blue, fill: true)
        drawCircle(screenWidth/2 - 10, screenHeight/2, radius: 30, color: UIColor.blue, fill: true)
        
        drawCircle(screenWidth/2 - 120, screenHeight/2 + 60, radius: 30, color: UIColor.blue, fill: true)
        drawCircle(screenWidth/2 - 40, screenHeight/2 + 60, radius: 30, color: UIColor.blue, fill: true)
        drawCircle(screenWidth/2 - 120, screenHeight/2 - 60, radius: 30, color: UIColor.blue, fill: true)
        drawCircle(screenWidth/2 - 40, screenHeight/2 - 60, radius: 30, color: UIColor.blue, fill: true)
        
        //Draw small blue circles
        drawCircle(screenWidth/2 + 140, screenHeight/2, radius: 10, color: UIColor.blue, fill: true)
        drawCircle(screenWidth/2 + 60, screenHeight/2, radius: 10, color: UIColor.blue, fill: true)
        
        drawCircle(screenWidth/2 + 100, screenHeight/2 + 40, radius: 10, color: UIColor.blue, fill: true)
        drawCircle(screenWidth/2 + 100, screenHeight/2 - 40, radius: 10, color: UIColor.blue, fill: true)
        
        drawCircle(screenWidth/2 + 130, screenHeight/2 + 30, radius: 10, color: UIColor.blue, fill: true)
        drawCircle(screenWidth/2 + 130, screenHeight/2 - 30, radius: 10, color: UIColor.blue, fill: true)
        
        drawCircle(screenWidth/2 + 70, screenHeight/2 + 30, radius: 10, color: UIColor.blue, fill: true)
        drawCircle(screenWidth/2 + 70, screenHeight/2 - 30, radius: 10, color: UIColor.blue, fill: true)
    }
    
}

/// Provides support for simple drawing functions
/// Operates in a similar manner to Princeton's StdDraw Java library (used in CS 3)
/// An extension adds functions to the existing class so you can use them as if they were defined there
extension UIView {
    
    /// This function will draw a line from the <x1, y1> point to the <x2, y2> point.
    ///
    /// Recall that <0, 0> is the top-left corner of the screen.  Example usage:
    ///
    ///```
    ///drawLine(0, 0, 100, 100) //draw a line from top-left corner down and right 100 pixels.  Will be a 1-pixel wide line, drawn in black
    ///
    ///drawLine(0, 0, 100, 100, lineWidth: 2.0) //same as above but with thicker line
    ///
    ///drawLine(0, 0, 100, 100, color: UIColor.red) //1-pixel wide line drawn in red
    ///```
    ///
    /// - parameters:
    ///   - x1: Starting x location
    ///   - y1: Starting y location
    ///   - x2: Ending x location
    ///   - y2: Ending y location
    ///   - lineWidth: Optional - the width of the line as a `CGFloat`.  Omitting this parameter will default to 1-pixel wide lines
    ///   - color: Optional - the color of the drawn line, as a `UIColor`.  Omitting this parameter will default to black (`UIColor.black`)
    func drawLine(_ x1 : Int, _ y1 : Int, _ x2 : Int, _ y2 : Int, lineWidth : CGFloat = 1, color : UIColor = UIColor.black) {
        let line = UIBezierPath()
        line.lineWidth = lineWidth
        color.setStroke()
        line.move(to: CGPoint(x: x1, y: y1))
        line.addLine(to: CGPoint(x: x2, y: y2))
        line.stroke()
    }
    
    /// This function will draw a rectangle from the given <x, y> position with the supplied width and height.  Options are provided for configuring line width, color, and drawing a filled rectangle.
    ///
    /// <0, 0> is the top-left corner of the screen.  Example usage:
    ///
    ///     drawRectangle(0, 0, 100, 100) //draw a square from top-left corner down and right 100 pixels.  Will be a 1-pixel wide line, drawn in black
    ///
    ///     drawRectangle(0, 0, 100, 100, lineWidth: 2.0) //same as above but with thicker line
    ///
    ///     drawRectangle(0, 0, 100, 100, color: UIColor.red) //1-pixel wide line drawn in red
    ///
    ///     drawRectangle(0, 0, 100, 100, fill: true) //filled black square
    ///
    /// - parameters:
    ///   - x: Starting x location
    ///   - y: Starting y location
    ///   - width: Rectangle width
    ///   - height: Rectangle height
    ///   - color: Optional - the color of the drawn line, as a `UIColor`.  Omitting this parameter will default to black (`UIColor.black`)
    ///   - fill: Optional - true if the rectangle should be filled / a solid color (black by default or supply a `color`)
    ///   - lineWidth: Optional - the width of the line as a `CGFloat`.  Omitting this parameter will default to 1-pixel wide lines
    func drawRectangle(_ x : Int, _ y : Int, width : Int, height : Int, color : UIColor = UIColor.black, fill : Bool = false, lineWidth : CGFloat = 1) {
        let rectangle = UIBezierPath(rect: CGRect(x: x, y: y, width: width, height: height))
        color.setFill()
        color.setStroke()
        if fill {
            rectangle.fill()
        }
        else {
            rectangle.lineWidth = lineWidth
            rectangle.stroke()
        }
    }
    
    /// This function will draw a circle centered at the given <x, y> position with the supplied radius.  Options are provided for configuring line width, color, and drawing a filled circle.
    ///
    /// <0, 0> is the top-left corner of the screen.  Example usage:
    ///
    ///     drawCircle(100, 100, 50) //draw a 50 pixel radius circle in roughly the top-left corner of the screen.  Will be a 1-pixel wide line, drawn in black
    ///
    ///     drawCircle(100, 100, 50, lineWidth: 2.0) //same as above but with thicker line
    ///
    ///     drawCircle(100, 100, 50, color: UIColor.red) //1-pixel wide line drawn in red
    ///
    ///     drawCircle(100, 100, 50, fill: true) //filled black circle
    ///
    /// - parameters:
    ///   - x: Starting x location
    ///   - y: Starting y location
    ///   - radius: One half circle width (diameter)
    ///   - color: Optional - the color of the drawn line, as a `UIColor`.  Omitting this parameter will default to black (`UIColor.black`)
    ///   - fill: Optional - true if the rectangle should be filled / a solid color (black by default or supply a `color`)
    ///   - lineWidth: Optional - the width of the line as a `CGFloat`.  Omitting this parameter will default to 1-pixel wide lines
    func drawCircle(_ x : Int, _ y : Int, radius : Int, color : UIColor = UIColor.black, fill : Bool = false, lineWidth : CGFloat = 1) {
        let circle = UIBezierPath(ovalIn: CGRect(x: x-radius, y: y-radius, width: radius*2, height: radius*2))
        color.setFill()
        color.setStroke()
        if fill {
            circle.fill()
        }
        else {
            circle.lineWidth = lineWidth
            circle.stroke()
        }
    }
    
    /// This function will draw an oval from the given (top-left) <x, y> position, bounded by the rectangle with the supplied width and height.  Options are provided for configuring line width, color, and drawing a filled rectangle.
    ///
    /// <0, 0> is the top-left corner of the screen.  Example usage:
    ///
    ///     drawOval(100, 100, 100, 200, 50) //draw an oval from given top-left corner, bounded by a 200w x 50h rectangle.  Will be a 1-pixel wide line, drawn in black
    ///
    ///     drawOval(100, 100, 100, 200, 50, lineWidth: 2.0) //same as above but with thicker line
    ///
    ///     drawOval(100, 100, 100, 200, 50, color: UIColor.red) //1-pixel wide line drawn in red
    ///
    ///     drawOval(100, 100, 100, 200, 50, fill: true) //filled black oval
    ///
    /// - parameters:
    ///   - x: Starting x location (top-left corner)
    ///   - y: Starting y location (top-left corner)
    ///   - width: Rectangle width
    ///   - height: Rectangle height
    ///   - color: Optional - the color of the drawn line, as a `UIColor`.  Omitting this parameter will default to black (`UIColor.black`)
    ///   - fill: Optional - true if the rectangle should be filled / a solid color (black by default or supply a `color`)
    ///   - lineWidth: Optional - the width of the line as a `CGFloat`.  Omitting this parameter will default to 1-pixel wide lines
    func drawOval(_  x : Int, _ y : Int, width : Int, height : Int, color : UIColor = UIColor.black, fill : Bool = false, lineWidth : CGFloat = 1) {
        let circle = UIBezierPath(ovalIn: CGRect(x: x, y: y, width: width, height: height))
        color.setFill()
        color.setStroke()
        if fill {
            circle.fill()
        }
        else {
            circle.lineWidth = lineWidth
            circle.stroke()
        }
    }
    
    /// This function will gradient-fill the given rectangle starting at the (top-left corner) <x, y> position with the supplied width and height.  Options are provided for configuring line width, color, and drawing a filled rectangle.
    ///
    /// <0, 0> is the top-left corner of the screen.  Example usage:
    ///
    ///     drawGradient(100, 100, width: 100, height: 200, colors: [UIColor.white, UIColor.black]) //draw left-to-right fill from white to black
    ///
    ///     //draw a diagonal gradient fill starting from the top-left corner to bottom-left corner
    ///     drawGradient(0, 0, width: screenWidth, height: screenHeight, colors: [UIColor.white, UIColor.black], startPoint: CGPoint(x: 0, y: 0), endPoint: CGPoint(x: 1, y: 1))
    ///
    /// - parameters:
    ///   - x: Starting x location (top-left corner)
    ///   - y: Starting y location (top-left corner)
    ///   - width: Rectangle width
    ///   - height: Rectangle height
    ///   - colors: An array of colors that comprise the gradient fill, e.g. `[UIColor.blue, UIColor.white, UIColor.blue]`
    ///   - startPoint: Optional - start point corresponds to the first stop of the gradient. The point is defined in the unit coordinate space <0 ..< 1> and is then mapped to the layer’s bounds rectangle when drawn.
    ///   - endPoint: Optional - end point corresponds to the last stop of the gradient. The point is defined in the unit coordinate space <0 ..< 1> and is then mapped to the layer’s bounds rectangle when drawn.
    func drawGradient(_ x : Int, _ y : Int, width : Int, height : Int, colors : [UIColor], startPoint : CGPoint = CGPoint(x: 0, y: 1), endPoint : CGPoint = CGPoint(x: 1, y: 1)) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = CGRect(x: x, y: y, width: width, height: height)
        
        var cgColors: [CGColor] = []
        
        for color in colors {
            cgColors.append(color.cgColor)
        }
        
        gradientLayer.colors     = cgColors
        gradientLayer.startPoint = startPoint
        gradientLayer.endPoint   = endPoint
        
        guard let context = UIGraphicsGetCurrentContext() else {
            return
        }
        
        context.saveGState()
        context.translateBy(x: CGFloat(x), y: CGFloat(y))
        gradientLayer.render(in: context)
        context.restoreGState()

    }
}
