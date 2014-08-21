/**
 * @Author: Fabio Barata, Plumbee Ltd
 */
package Contexts {
import Commands.NumberCommand;
import Commands.OperatorController;

import Events.NumberEvent;
import Events.OperatorEvent;

import Mediators.NumberMediator;
import Mediators.OperatorMediator;
import Mediators.TextMediator;

import Models.CalculatorModel;


import Views.ICalcTextView;
import Views.INumbersView;
import Views.IOperatorsView;

import robotlegs.bender.extensions.contextView.ContextView;

import robotlegs.bender.extensions.eventCommandMap.api.IEventCommandMap;

import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;
import robotlegs.bender.framework.api.IConfig;
import robotlegs.bender.framework.api.IInjector;

public class CalculatorConfig implements IConfig {
    [Inject]
    public var injector:IInjector;

    [Inject]
    public var mediatorMap:IMediatorMap;

    [Inject]
    public var commandMap:IEventCommandMap;

    [Inject]
    public var contextView:ContextView;

    public function configure():void {
        injector.map(CalculatorModel).asSingleton();

        mediatorMap.map(IOperatorsView).toMediator(OperatorMediator);
        mediatorMap.map(INumbersView).toMediator(NumberMediator);
        mediatorMap.map(ICalcTextView).toMediator(TextMediator);

        commandMap.map(NumberEvent.eventType,NumberEvent).toCommand(NumberCommand);
        commandMap.map(OperatorEvent.eventType,OperatorEvent).toCommand(OperatorController);
    }
}
}
