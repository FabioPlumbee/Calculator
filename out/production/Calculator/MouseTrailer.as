/**
 * Dynamic Mouse Trailer
 * ---------------------
 * VERSION: 1.0
 * DATE: 3/13/2010
 * AS3
 * UPDATES AND DOCUMENTATION AT: http://www.FreeActionScript.com
 **/

package
{
	import flash.display.Sprite;
	import flash.events.Event;
    import flash.events.MouseEvent;

public class MouseTrailer extends Sprite
	{
		// Vars
		private var particleArray:Array;
        private var particlePool:Array;

		// Settings
		public static const particleMaxSpeed:Number = 1;
		public static const particleFadeSpeed:Number = .05;
		public static const particleTotal:int = 5;
		public static const particleRange:Number = 25;
		private var particleCurrentAmount:int = 0;
        public var particleColor:int = 0xFF0000;
        public var borderColor:int = 0x990000;

		public function MouseTrailer()
		{
            particleArray = [];
            particlePool = [];

            addEventListener(Event.ENTER_FRAME, onEnterFrameLoop);
            addEventListener(Event.ADDED_TO_STAGE, onStageInit);
		}

        private function onStageInit(event:Event):void {
            removeEventListener(Event.ADDED_TO_STAGE, onStageInit);
            stage.addEventListener(MouseEvent.MOUSE_DOWN,onMouseDownEvent, true);
            stage.addEventListener(MouseEvent.MOUSE_UP,onMouseUpEvent, true);
        }

		private function onEnterFrameLoop(event:Event):void
		{
			createParticle(stage.mouseX, stage.mouseY);

			updateParticle();
		}

        private function onMouseDownEvent(event:MouseEvent):void {
            particleColor = Math.random()*0xFFFFFF;
        }
        private function onMouseUpEvent(event:MouseEvent):void {
            borderColor = Math.random()*0xFFFFFF;
        }

		/**
		 * createParticle(target X position, target Y position)
		 */
		private function createParticle(targetX:Number, targetY:Number):void
		{
			//run for loop based on particleTotal
			for (var i:Number = 0; i < particleTotal; i++)
			{
                var particle_mc:Particle;
                if (particlePool.length == 0)
    				particle_mc = new Particle();
                else
                    particle_mc = particlePool.pop();

                particle_mc.createShape("circle", 3, targetX, targetY, particleColor, borderColor);
 
				//set position & rotation, alpha
				particle_mc.rotation = Math.random() * 360;
				particle_mc.alpha = Math.random() * .5 + .5;
 
				//set particle boundry
				particle_mc.boundyLeft = targetX - particleRange;
				particle_mc.boundyTop = targetY - particleRange;
				particle_mc.boundyRight = targetX + particleRange;
				particle_mc.boundyBottom = targetY + particleRange;
 
				//set speed/direction of fragment
				particle_mc.speedX = Math.random() * particleMaxSpeed - Math.random() * particleMaxSpeed;
				particle_mc.speedY = Math.random() * particleMaxSpeed - Math.random() * particleMaxSpeed;
				particle_mc.speedX *= particleMaxSpeed;
				particle_mc.speedY *= particleMaxSpeed;
 
				//set fade out speed
				particle_mc.fadeSpeed = Math.random()*particleFadeSpeed;
 
				//just a visual particle counter
				particleCurrentAmount++;
 
				// add to array
				particleArray.push(particle_mc);
 
				// add to display list
				addChild(particle_mc);
			}
		}
 
		private function updateParticle():void
		{
			for (var i:int = 0; i < particleArray.length; i++)
			{
				var tempParticle:Particle = particleArray[i];
 
				//update alpha, x, y
				tempParticle.alpha -= tempParticle.fadeSpeed;
				tempParticle.x += tempParticle.speedX;
				tempParticle.y += tempParticle.speedY;
 
				// if fragment is invisible remove it
				if (tempParticle.alpha <= 0)
				{
					destroyParticle(tempParticle);
				}
				// if fragment is out of bounds, increase fade out speed
				else if (tempParticle.x < tempParticle.boundyLeft ||
						tempParticle.x > tempParticle.boundyRight ||
						tempParticle.y < tempParticle.boundyTop ||
						tempParticle.y > tempParticle.boundyBottom)
				{
					tempParticle.fadeSpeed += .05;
				}
			}
		}
 
		private function destroyParticle(particle:Particle):void
		{
			for (var i:int = 0; i < particleArray.length; i++)
			{
				var tempParticle:Particle = particleArray[i];
				if (tempParticle == particle)
				{
                    particlePool.push(particle);
					particleCurrentAmount--;
					particleArray.splice(i,1);
					removeChild(tempParticle);
				}
			}
		}
 
	}
 
}
