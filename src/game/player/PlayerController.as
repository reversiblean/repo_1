package game.player 
{
	import flash.ui.Keyboard;
	import game.Key;
	import starling.core.Starling;
	import starling.display.Stage;
	import starling.events.KeyboardEvent;
	/**
	 * ...
	 * @author Gayan
	 */
	public class PlayerController 
	{
		private var _model:Player;
		private var _stage:Stage;
			
		
		public function PlayerController(model:Player) 
		{
			// references
			_model = model;
			_stage = Starling.current.stage;
			
			_stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
			_stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
		}
		
		private function onKeyUp(e:KeyboardEvent):void 
		{	
			var keyCode:uint = e.keyCode;
			
			if (keyCode == Keyboard.W)
			{
				Key.UP = false;
			}
			if (keyCode == Keyboard.S)
			{
				Key.DOWN = false;
			}
			if (keyCode == Keyboard.A)
			{
				Key.LEFT = false;
			}
			if (keyCode == Keyboard.D)
			{
				Key.RIGHT = false;
			}
		
		}
		
		private function onKeyDown(e:KeyboardEvent):void 
		{	
			var keyCode:uint = e.keyCode;
			
			if (keyCode == Keyboard.W)
			{
				Key.UP = true;
			}
			if (keyCode == Keyboard.S)
			{
				Key.DOWN = true;
			}
			if (keyCode == Keyboard.A)
			{
				Key.LEFT = true;
			}
			if (keyCode == Keyboard.D)
			{
				Key.RIGHT = true;
			}
			
		}
		
	}

}