package {
import flash.display.Sprite;

public class Particle extends Sprite{

    private var _lifeTime: int=0;
    public var boundyLeft:Number;
    public var boundyTop:Number;
    public var boundyRight:Number;
    public var boundyBottom:Number;
    public var speedX:Number;
    public var speedY:Number;
    public var fadeSpeed:Number;

    public function Particle() {
    }


    public function get lifeTime():int {
        return _lifeTime;
    }

    public function set lifeTime(value:int):void {
        _lifeTime = value;
    }


    public function createShape(shapeType:String,size: int,x:int = 0, y:int=0, color:int = 0xFF0000, border:int = 0x990000):void{
        //var size:int = 100;

        this.graphics.clear();
        this.graphics.lineStyle(1, border);
        switch (shapeType) {
            case "circle":
                this.graphics.beginFill(color);
                this.graphics.drawCircle(size / 2, size / 2, size / 2);
                this.graphics.endFill();

                break;
            case "square":
                this.graphics.beginFill(color);
                this.graphics.drawRect(0, 0, size, size);
                this.graphics.endFill();
                break;
            case "triangle":
                this.graphics.beginFill(color);
                this.graphics.moveTo(size / 2, 0);
                this.graphics.lineTo(size, size);
                this.graphics.lineTo(0, size);
                this.graphics.lineTo(size / 2, 0);
                this.graphics.endFill();

                break;
        }
        this.x = x;
        this.y = y;
    }
}
}
