/**
 * @Author: Fabio Barata, Plumbee Ltd
 */
package Events {
import flash.events.Event;

public class OperatorCommandEvent extends Event {
    private var _op:int;

    public static const eventType:String = "OperatorCommand";

    public function OperatorCommandEvent(op:int) {
        super(eventType);
        _op = op;
    }

    public function get op():int {
        return _op;
    }

    override public function clone() : Event
    {
        return new OperatorCommandEvent(_op);
    }
}
}
