package com.ok.testapp.commands {
import com.ok.testapp.services.ClickCounterService;

import robotlegs.bender.bundles.mvcs.Command;
import robotlegs.bender.extensions.commandCenter.api.ICommand;

public class RegisterClickCommand extends Command implements ICommand {

	[Inject]
	public var service : ClickCounterService;

	public override function execute() : void
	{
		this.service.count();
	}
}
}
