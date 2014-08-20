/**
 * @Author: Jakub Pudelek, Plumbee Ltd
 */
package Events {
import flash.events.Event;

public class NumberEvent extends Event {
    private var _number:Number = 0;

    public static const eventType:String = "NumberEntered";

    public function NumberEvent(number:Number) {
        super(eventType);
        this._number = number;
    }

    public function get number():Number {
        return _number;
    }
}
}
