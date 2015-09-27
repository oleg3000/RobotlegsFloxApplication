package com.ok.testapp.events.remote {
import flash.events.Event;

public class RemoteSendEventEvent extends Event {

	public static const SEND_EVENT : String = "sendEvent";

	private var _remoteEventType : String;
	private var _remoteEventData : Object;

	public function RemoteSendEventEvent(type : String, remoteEventType : String, remoteEventData : Object = null)
	{
		super(type);
		_remoteEventType = remoteEventType;
		_remoteEventData = remoteEventData;
	}

	public function get remoteEventType() : String
	{
		return _remoteEventType;
	}

	public function get remoteEventData() : Object
	{
		return _remoteEventData;
	}
}
}
