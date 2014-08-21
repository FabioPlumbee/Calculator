/**
 * @Author: Fabio Barata, Plumbee Ltd
 */
package Events {
import flash.events.Event;

public class NumberCommandEvent extends Event {
    private var _number:int = 0;

    public static const eventType:String = "NumberCommand";

    public function NumberCommandEvent(number:int) {
        super(eventType);
        this._number = number;
    }

    public function get number():int {
        return _number;
    }

    override public function clone() : Event
    {
        return new NumberCommandEvent(number);
    }
}
}
