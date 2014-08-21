/**
 * @Author: Fabio Barata, Plumbee Ltd
 */
package Events {
import flash.events.Event;

public class NumberPressedEvent extends Event {
    public static const eventType:String = "NumberPressed";

    private var _number:int;

    public function NumberPressedEvent(number:int) {
        super(eventType);

        this._number = number;
    }


    public function get number():int {
        return _number;
    }

    override public function clone() : Event
    {
        return new NumberPressedEvent(number);
    }
}
}
