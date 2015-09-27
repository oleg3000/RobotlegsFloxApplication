package com.ok.testapp.events {
import starling.events.Event;

public class ScreenEvent extends Event {

	public static const GO_TO_MAIN_TRIGGERED : String = "goToMainTriggered";
	public static const GO_TO_INTRO_TRIGGERED : String = "goToIntroTriggered";
	public static const SAVE_CLICKS_TRIGGERED : String = "saveClicksTriggered";

	public function ScreenEvent(type : String, bubbles : Boolean = false, data : Object = null)
	{
		super(type, bubbles, data);
	}
}
}

