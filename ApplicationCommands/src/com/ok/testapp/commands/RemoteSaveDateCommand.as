package com.ok.testapp.commands {
import com.ok.testapp.events.remote.RemoteSaveDateEvent;
import com.ok.testapp.services.remote.IRemoteService;

import robotlegs.bender.bundles.mvcs.Command;
import robotlegs.bender.extensions.commandCenter.api.ICommand;

public class RemoteSaveDateCommand extends Command implements ICommand {

	[Inject]
	public var service : IRemoteService;

	public override function execute() : void
	{
		this.service.saveDate();
	}

}
}
