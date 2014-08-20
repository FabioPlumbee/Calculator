/**
 */
package Models.Operators {
public class OperatorFactory {
    public static const PLUS:int = 1;
    public static const MINUS:int = 2;
    public static const MULTIPLY:int = 3;
    public static const DIVIDE:int = 4;
    public static const EQUALS:int = 5;

    public static function createNumber(val:Number):Operator {
        return new Numeric(val);
    }

    public static function createOperator(op:int,... args):Operator {
        switch (op) {
            case EQUALS:
                if (args.length > 0)
                    return new Equals(args[0]);
                return new Equals(createNumber(0));
            case PLUS:
                return new Plus(args);
            case MINUS:
                return new Minus(args);
            case MULTIPLY:
                return new Multiply(args);
            case DIVIDE:
                return new Divide(args);
        }

        return null;
    }
}
}
