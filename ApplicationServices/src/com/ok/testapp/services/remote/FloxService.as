package com.ok.testapp.services.remote {
import com.gamua.flox.Flox;
import com.ok.testapp.models.ServerDateFloxModel;

import flash.events.IEventDispatcher;

public class FloxService implements IRemoteService {

	private const ID : String = "fmwazre3ynyg0Kui";
	private const KEY : String = "32Z1li4k7Hof8J5q";
	private const VERSION : String = "1.0";

	[Inject]
	public var eventDispatcher : IEventDispatcher;

	public function FloxService() : void
	{
		Flox.init(ID, KEY, VERSION);
	}

	public function saveDate() : void
	{
		(new ServerDateFloxModel).save(onComplete, onError);
	}

	public function sendEvent(eventName : String, data : Object = null) : void
	{
		Flox.logEvent(eventName, data);
	}

	private function onComplete(entity : ServerDateFloxModel) : void
	{
		//Notify user about success
		Flox.logInfo("Server Date: " + entity.updatedAt.toDateString());
	}

	private function onError(error : String) : void
	{
		//Notify user about error
	}
}
}
