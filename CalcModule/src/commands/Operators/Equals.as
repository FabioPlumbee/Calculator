/**
 */
package Commands.Operators {
public class Equals implements Operator {
    private var val:Operator;

    public function Equals(a:Operator) {
        val = a;
    }

    public function Execute():Number {
        return val.Execute();
    }
}
}
