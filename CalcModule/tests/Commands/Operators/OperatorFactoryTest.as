/**
 * @Author: Fabio Barata, Plumbee Ltd
 */
package Commands.Operators {

import org.flexunit.asserts.assertTrue;

public class OperatorFactoryTest {
    [Test]
    public function testNumber() {
        assertTrue(OperatorFactory.createNumber(0) is Numeric);
    }

    [Test]
    public function testPlus() {
        var n1:Operator = OperatorFactory.createNumber(1);
        var n2:Operator = OperatorFactory.createNumber(0);
        assertTrue(OperatorFactory.createOperator(OperatorFactory.PLUS,n1,n2) is Plus);
    }

    [Test]
    public function testMinus() {
        var n1:Operator = OperatorFactory.createNumber(1);
        var n2:Operator = OperatorFactory.createNumber(0);
        assertTrue(OperatorFactory.createOperator(OperatorFactory.MINUS,n1,n2) is Minus);
    }

    [Test]
    public function testMultiply() {
        var n1:Operator = OperatorFactory.createNumber(1);
        var n2:Operator = OperatorFactory.createNumber(0);
        assertTrue(OperatorFactory.createOperator(OperatorFactory.MULTIPLY,n1,n2) is Multiply);
    }

    [Test]
    public function testDivide() {
        var n1:Operator = OperatorFactory.createNumber(1);
        var n2:Operator = OperatorFactory.createNumber(0);
        assertTrue(OperatorFactory.createOperator(OperatorFactory.DIVIDE,n1,n2) is Divide);
    }

    [Test]
    public function testEquals() {
        assertTrue(OperatorFactory.createOperator(OperatorFactory.EQUALS,OperatorFactory.createNumber(0)) is Equals);
    }
}
}
