/**
 */
package Models.Operators {
public class Numeric implements Operator {
    private var val:Number;

    public function Numeric(a:Number) {
        val = a;
    }

    public function Execute():Number {
        return val;
    }
}
}
