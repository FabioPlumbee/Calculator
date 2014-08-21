/**
 * @Author: Jakub Pudelek, Plumbee Ltd
 */
package {
import Commands.Operators.Operator;
import Commands.Operators.OperatorFactory;
import Commands.Operators.SqrRt;

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
    public function testPlus():void {
        var n1:Operator = OperatorFactory.createNumber(7);
        var n2:Operator = OperatorFactory.createNumber(4);
        var op:Operator = OperatorFactory.createOperator(OperatorFactory.PLUS,n1,n2);

        assertEquals(11,op.Execute());
    }

    [Test]
    public function testMinus():void {
        var n1:Operator = OperatorFactory.createNumber(7);
        var n2:Operator = OperatorFactory.createNumber(4);
        var op:Operator = OperatorFactory.createOperator(OperatorFactory.MINUS,n1,n2);

        assertEquals(3,op.Execute());
    }

    [Test]
    public function testMultiply():void {
        var n1:Operator = OperatorFactory.createNumber(7);
        var n2:Operator = OperatorFactory.createNumber(4);
        var op:Operator = OperatorFactory.createOperator(OperatorFactory.MULTIPLY,n1,n2);

        assertEquals(28,op.Execute());
    }

    [Test]
    public function testDivide():void {
        var n1:Operator = OperatorFactory.createNumber(7);
        var n2:Operator = OperatorFactory.createNumber(4);
        var op:Operator = OperatorFactory.createOperator(OperatorFactory.DIVIDE,n1,n2);

        assertEquals(7/4,op.Execute());
    }

    [Test]
    public function testMixed():void {
        var n1:Operator = OperatorFactory.createNumber(7);
        var n2:Operator = OperatorFactory.createNumber(4);
        var op1:Operator = OperatorFactory.createOperator(OperatorFactory.MULTIPLY,n1,n2);
        var op2:Operator = OperatorFactory.createOperator(OperatorFactory.PLUS,op1,n2);
        var op3:Operator = OperatorFactory.createOperator(OperatorFactory.DIVIDE,n2,op2);
        var ope:Operator = OperatorFactory.createOperator(OperatorFactory.EQUALS,op3);

        assertEquals(1/8,ope.Execute());
    }

    [Test]
    public function testSqrtRoot():void {
        var n1:Operator = OperatorFactory.createNumber(10);
        var srt:Operator = new SqrRt(n1);

        assertEquals(Math.sqrt(10),srt.Execute());
    }
}
}
