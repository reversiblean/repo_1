package game.phys 
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.system.Capabilities;
	import nape.geom.Vec2;
	import nape.phys.Body;
	import nape.phys.BodyType;
	import nape.shape.Polygon;
	import nape.space.Space;
	import nape.util.BitmapDebug;
	import nape.util.Debug;
	import starling.errors.AbstractClassError;
	/**
	 * ...
	 * @author Gayan
	 */
	public class Phys 
	{
		
		public function Phys() { throw new AbstractClassError(); }
		
		/** Pixels to Meter */
		public static const SCALE:Number = 30;
		
		/** Nape space */
		public static var space:Space;
		
		private static var _gravity:Vec2;
		
		/** Debug Sprite */
		private static var _debugSprite:DisplayObject;
		
		public static var debug:Debug;
		
		/** body that holds static obstacles including the
		 * static border around the stage */
		public static var obstacles:Body;
		
		public static function get debugSprite():DisplayObject
		{
			if (_debugSprite) return _debugSprite;
			else throw new Error("Trying to access null object reference: debugSprite");
		}
		
		/**
		 * Initialize the public static var 'space' in the abstract class 'Phys'
		 * @param	gravity
		 * @return	Space	Returns a reference to the space variable in the abstract class 'Phys'
		*/
		public static function initNape(gravity:Vec2 = null):Space
		{
			_gravity = gravity;
			
			// setup space
			space = new Space(_gravity);
			space.worldLinearDrag = 0.65;
			space.worldAngularDrag = 1.2;
					
			// setup debug draw
			debug = new BitmapDebug(Const.GameWidth, Const.GameHeight, 0, true);
			_debugSprite = debug.display;
						
			return space;
		}
		
		public static function debugDraw():void
		{
			// clear the debug display
			debug.clear();
			
			// draw the space
			debug.draw(space);
			
			// flush draw calls
			debug.flush();
		}
		
		/** Create a static border around the stage */
		public static function createBounderies():void
		{
			var w:int = Const.GameWidth;
			var h:int = Const.GameHeight;
			
			obstacles = new Body(BodyType.STATIC);
			obstacles.shapes.add(new Polygon(Polygon.rect(0, 0, w, -3)));	// top
			obstacles.shapes.add(new Polygon(Polygon.rect(0, h, w, 3)));	// bottom
			obstacles.shapes.add(new Polygon(Polygon.rect(0, 0, -3, h)));	// left
			obstacles.shapes.add(new Polygon(Polygon.rect(w, 0, 3, h)));	// right
			
			obstacles.space = space;
		}
		
		public static function addObstacle(position:Vec2):void
		{
			var x:Number = position.x;
			var y:Number = position.y;
			var w:Number = 30, h:Number = 30;
			
			obstacles.space = null;
			obstacles.shapes.add(new Polygon(Polygon.rect(x, y, w, h)));
			obstacles.space = space;
		}

		
		public static function set gravity(value:Vec2):void
		{
			_gravity = Vec2.weak(value.x, value.y);
			if (space) space.gravity = _gravity;
		}
		
		
		
		
		
	}

}