/**
 * @Author: Jakub Pudelek, Plumbee Ltd
 */
package Events {
import flash.events.Event;

public class OperatorPressedEvent extends Event {
    public static const plusType:String = "OpPLUS";
    public static const minusType:String = "OpMINUS";
    public static const multiplyType:String = "OpMULTIPLY";
    public static const divideType:String = "OpDIVIDE";
    public static const equalsType:String = "OpEQUALS";

    public function OperatorPressedEvent(type:String) {
        super(type);
    }
}
}
