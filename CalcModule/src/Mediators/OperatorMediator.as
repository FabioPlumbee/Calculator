/**
 * @Author: Fabio Barata, Plumbee Ltd
 */
package Mediators {
import Events.NumberCommandEvent;
import Events.NumberPressedEvent;
import Events.OperatorCommandEvent;
import Events.OperatorPressedEvent;

import Commands.Operators.OperatorFactory;

import flash.events.Event;

import robotlegs.bender.bundles.mvcs.Mediator;

public class OperatorMediator extends Mediator {
    override public function initialize():void {
        addViewListener(OperatorPressedEvent.plusType,onPlusPressed);
        addViewListener(OperatorPressedEvent.minusType,onMinusPressed);
        addViewListener(OperatorPressedEvent.multiplyType,onMultPressed);
        addViewListener(OperatorPressedEvent.divideType,onDivPressed);
        addViewListener(OperatorPressedEvent.equalsType,onEqualsPressed);
    }

    public function onNumberPressed(event:NumberPressedEvent):void {
        dispatch(new NumberCommandEvent(event.number));
    }

    public function onPlusPressed(event:Event):void {
        dispatch(new OperatorCommandEvent(OperatorFactory.PLUS));
    }
    public function onMinusPressed(event:Event):void {
        dispatch(new OperatorCommandEvent(OperatorFactory.MINUS));
    }
    public function onMultPressed(event:Event):void {
        dispatch(new OperatorCommandEvent(OperatorFactory.MULTIPLY));
    }
    public function onDivPressed(event:Event):void {
        dispatch(new OperatorCommandEvent(OperatorFactory.DIVIDE));
    }
    public function onEqualsPressed(event:Event):void {
        dispatch(new OperatorCommandEvent(OperatorFactory.EQUALS));
    }
}
}
