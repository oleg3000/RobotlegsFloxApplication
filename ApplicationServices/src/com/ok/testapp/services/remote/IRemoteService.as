package com.ok.testapp.services.remote {

public interface IRemoteService {
	function saveDate () : void;

	function sendEvent(type : String, data : Object = null) : void;
}
}
