package com.ok.testapp.events {
import flash.events.Event;

public class ViewEvent extends Event {
	public static const CHANGE_SCREEN : String = "changeScreen";

	private var _viewId : String;

	public function ViewEvent(type : String, viewId : String)
	{
		super(type);

		_viewId = viewId;
	}

	public function get viewId() : String
	{
		return _viewId;
	}
}
}
