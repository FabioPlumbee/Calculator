/**
 * @Author: Fabio Barata, Plumbee Ltd
 */
package Views {

import Contexts.CalculatorContext;

import flash.display.Sprite;

public class Calculator extends Sprite {
    private var _context:CalculatorContext;

    public function Calculator() {
        _context = new CalculatorContext(this);

        addChild(new CalcTextView());
        addChild(new NumbersView());
        addChild(new OperatorsView());
    }
}
}
