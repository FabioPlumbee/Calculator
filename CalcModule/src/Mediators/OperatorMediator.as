/**
 * @Author: Jakub Pudelek, Plumbee Ltd
 */
package Mediators {
import Events.OperatorEvent;
import Events.OperatorPressedEvent;
import Events.UpdateTextEvent;

import Models.OperatorModel;

import Models.Operators.OperatorFactory;

import Views.Calculator;

import flash.display.Sprite;
import flash.events.Event;

import flash.events.MouseEvent;

import robotlegs.bender.bundles.mvcs.Mediator;

public class OperatorMediator extends Mediator {
    [Inject]
    public var calculator:Calculator;

    [Inject]
    public var model:OperatorModel;

    override public function initialize():void {
        addViewListener(OperatorPressedEvent.plusType,onPlusPressed);
        addViewListener(OperatorPressedEvent.minusType,onMinusPressed);
        addViewListener(OperatorPressedEvent.multiplyType,onMultPressed);
        addViewListener(OperatorPressedEvent.divideType,onDivPressed);
        addViewListener(OperatorPressedEvent.equalsType,onEqualsPressed);

        addContextListener(UpdateTextEvent.eventType,onUpdateText);
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

    public function onUpdateText(event:Event) {
        calculator.updateText(model.numberToShow);
    }
}
}
