/**
 * @Author: Fabio Barata, Plumbee Ltd
 */
package Contexts {
import flash.display.DisplayObjectContainer;

import robotlegs.bender.bundles.mvcs.MVCSBundle;
import robotlegs.bender.framework.api.IContext;

import robotlegs.bender.framework.impl.Context;
import robotlegs.bender.extensions.contextView.ContextView;

public class CalculatorContext {

    public function CalculatorContext(view:DisplayObjectContainer) {
        super();
        var _context:IContext = new Context()
                .install(MVCSBundle)
                .configure(CalculatorConfig, new ContextView(view));
    }
}
}
