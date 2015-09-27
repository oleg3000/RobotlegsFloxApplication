package com.ok.testapp.events {
import flash.events.Event;

public class ClickCounterEvent extends Event {

	public static const REGISTER_CLICK : String = "registerClick";

	public function ClickCounterEvent(type : String)
	{
		super(type);
	}
}
}
