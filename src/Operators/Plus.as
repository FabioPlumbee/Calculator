/**
 */
package Operators {
public class Plus implements Operator {
    public function Plus(... args) {
        for (var i:int = 0;i < args.length;i++)
            this.args.push(args[i]);
    }

    private var args:Vector.<Operator> = new Vector.<Operator>();

    public function Execute():Number {
        var r:Number = 0;
        for (var i:int = 0;i < args.length;i++)
            r += args[i].Execute();
        return r;
    }
}
}
