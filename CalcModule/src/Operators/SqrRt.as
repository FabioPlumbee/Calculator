/**
 * @Author: Jakub Pudelek, Plumbee Ltd
 */
package Operators {
public class SqrRt implements Operator {
    var val:Operator = null;

    public function SqrRt(n1:Operator) {
        val = n1;
    }

    public function Execute():Number {
        return Math.sqrt(val.Execute());
    }
}
}
