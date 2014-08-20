/**
 * @Author: Jakub Pudelek, Plumbee Ltd
 */
package {
import Operators.Divide;
import Operators.Minus;
import Operators.Multiply;
import Operators.Numeric;
import Operators.Operator;
import Operators.Plus;
import Operators.SqrRt;

import org.flexunit.asserts.assertEquals;

public class CalculatorTest {
    public function CalculatorTest() {
    }


    [Before]
    public function setUp():void {

    }


    [After]
    public function tearDown():void {

    }


    [Test]
    public function testName():void {
        var n1:Operator = new Numeric(7);
        assertEquals(n1.Execute(),7);
        var n2:Operator = new Numeric(4);

        var plustest:Operator = new Plus(n1,n2);
        var minustest:Operator = new Minus(n1,n2);
        var multtest:Operator = new Multiply(plustest,minustest);
        var n3:Operator = new Numeric(plustest.Execute());
        var divtest:Operator = new Divide(n3,multtest);

        assertEquals(11,plustest.Execute());
        assertEquals(3,minustest.Execute());
        assertEquals(33,multtest.Execute());
        assertEquals(1/3,divtest.Execute());
    }

    [Test]
    public function testSqrtRoot():void {
        var n1:Operator = new Numeric(10);
        var srt:Operator = new SqrRt(n1);

        assertEquals(Math.sqrt(10),srt.Execute());
    }
}
}
