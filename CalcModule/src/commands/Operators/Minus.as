/**
 * @Author: Fabio Barata, Plumbee Ltd
 */
package Commands.Operators {
public class Minus implements Operator {
    public function Minus(args:Array) {
        for (var i:int = 0;i < args.length;i++)
            this.args.push(args[i]);
    }

    private var args:Vector.<Operator> = new Vector.<Operator>();

    public function Execute():Number {
        var r:Number = 0;
        if (args.length > 0)
            r = args[i].Execute();
        for (var i:int = 1;i < args.length;i++)
            r -= args[i].Execute();
        return r;
    }
}
}
