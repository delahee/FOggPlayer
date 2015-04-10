import flash.geom.Matrix;
import flash.display.Shape;
import flash.display.Graphics;
import flash.display.GradientType;
import flash.display.SpreadMethod;
import flash.display.InterpolationMethod;

// ButtonState class

class ButtonState extends Shape
{
    // The state of this particular ButtonState

    var state : State;

    // Create a new ButtonState

    public function new(s : State)
    {
	super();
	state = s;
    }

    // Draw the shape

    public function draw()
    {
	var g = graphics;

	// Create a nice gradient

	var w : Int = 21;
	var h : Int = 21;
	var colors : Array<Int> = [];
	var alphas : Array<Int> = [1, 1];
	var ratios : Array<Int> = [0, 255];
	var matrix : Matrix = new Matrix();

	// Change the colours according to the state

	switch (state)
	{
	case over:
	    colors = [0xf0f0f0, 0xa0a0a0];
	case down:
	    colors = [0xa0a0a0, 0xf0f0f0];
	case out:
	    colors = [0xd0d0d0, 0xb0b0b0];
	}

	// Create a gradient

	matrix.createGradientBox(w - 2, h - 2, Math.PI / 2, 0, 0);
	g.beginGradientFill(GradientType.LINEAR, 
			    colors,
			    alphas,
			    ratios, 
			    matrix, 
			    SpreadMethod.PAD, 
			    InterpolationMethod.LINEAR_RGB, 
			    0);

	// Draw the button

	g.drawRoundRect(0, 0, w, h, 5, 5);
	g.endFill();

	// Add the drop-shadow filter. We don't want one
	// because the buttons are adjacent, and the full
	// height of the frame.

// 	var shadow : DropShadowFilter = new
// 	    DropShadowFilter(4, 45, 0x000000, 0.8, 4, 4, 0.65,
// 			     BitmapFilterQuality.HIGH, false, false);
// 	var af : Array<DropShadowFilter> = new Array();
// 	af.push(shadow);
// 	filters = af;
    }
}
