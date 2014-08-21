/**
 * @Author: Fabio Barata, Plumbee Ltd
 */
package Mediators {
import Events.NumberEvent;
import Events.NumberPressedEvent;
import Events.OperatorEvent;
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
        dispatch(new NumberEvent(event.number));
    }

    public function onPlusPressed(event:Event):void {
        dispatch(new OperatorEvent(OperatorFactory.PLUS));
    }
    public function onMinusPressed(event:Event):void {
        dispatch(new OperatorEvent(OperatorFactory.MINUS));
    }
    public function onMultPressed(event:Event):void {
        dispatch(new OperatorEvent(OperatorFactory.MULTIPLY));
    }
    public function onDivPressed(event:Event):void {
        dispatch(new OperatorEvent(OperatorFactory.DIVIDE));
    }
    public function onEqualsPressed(event:Event):void {
        dispatch(new OperatorEvent(OperatorFactory.EQUALS));
    }
}
}
