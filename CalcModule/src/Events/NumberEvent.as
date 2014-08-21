/**
 * @Author: Fabio Barata, Plumbee Ltd
 */
package Events {
import flash.events.Event;

public class NumberEvent extends Event {
    private var _number:int = 0;

    public static const eventType:String = "NumberCommand";

    public function NumberEvent(number:int) {
        super(eventType);
        this._number = number;
    }

    public function get number():int {
        return _number;
    }

    override public function clone() : Event
    {
        return new NumberEvent(number);
    }
}
}
