package com.ok.testapp.commands {
import com.ok.testapp.events.remote.RemoteSendEventEvent;
import com.ok.testapp.services.remote.IRemoteService;

import robotlegs.bender.bundles.mvcs.Command;
import robotlegs.bender.extensions.commandCenter.api.ICommand;

public class RemoteSendEventCommand extends Command implements ICommand {

	[Inject]
	public var service : IRemoteService;

	[Inject]
	public var event : RemoteSendEventEvent;

	public override function execute() : void
	{
		this.service.sendEvent(event.remoteEventType , event.remoteEventData);
	}

}
}
