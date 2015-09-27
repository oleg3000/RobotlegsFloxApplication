package com.ok.testapp.events.remote {

import flash.events.Event;

public class RemoteSaveDateEvent extends Event {

	public static const SAVE_CLICKS : String = "saveClicks";

	public function RemoteSaveDateEvent(type : String)
	{
		super(type);
	}
}
}
