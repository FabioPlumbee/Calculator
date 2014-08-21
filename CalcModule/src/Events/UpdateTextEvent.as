/**
 * @Author: Fabio Barata, Plumbee Ltd
 */
package Events {
import flash.events.Event;

public class UpdateTextEvent extends Event {
    public static const eventType:String = "UpdateText";

    public function UpdateTextEvent() {
        super(eventType);
    }

    override public function clone() : Event
    {
        return new UpdateTextEvent();
    }
}
}
