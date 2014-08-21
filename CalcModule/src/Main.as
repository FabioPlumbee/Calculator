package {

import Views.Calculator;

import flash.display.Sprite;

public class Main extends Sprite {
    public function Main() {
        var button:Button = new Button(50,50);
        this.addChild(button);

        var mousetrailer:MouseTrailer = new MouseTrailer();
        this.addChild(mousetrailer);

        var calc:Calculator = new Calculator();
        calc.x = 200;
        calc.y = 0;

        this.addChild(calc);
    }
}
}
