/**
 * @Author: Fabio Barata, Plumbee Ltd
 */
package Views {
import flash.display.Sprite;
import flash.text.TextField;

public class CalcTextView extends TextField implements ICalcTextView {
    public function CalcTextView() {
        x = 0;
        y = 0;

        updateText(0);
    }

    public function updateText(number:Number):void {
        text = String(number);
    }
}
}
