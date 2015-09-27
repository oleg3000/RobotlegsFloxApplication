package com.ok.testapp.config {
import com.ok.testapp.commands.RegisterClickCommand;
import com.ok.testapp.commands.RemoteSaveDateCommand;
import com.ok.testapp.commands.RemoteSendEventCommand;
import com.ok.testapp.events.ClickCounterEvent;
import com.ok.testapp.events.remote.RemoteSaveDateEvent;
import com.ok.testapp.events.remote.RemoteSendEventEvent;
import com.ok.testapp.mediators.screens.IntroScreenMediator;
import com.ok.testapp.mediators.MainViewMediator;
import com.ok.testapp.mediators.screens.MainScreenMediator;
import com.ok.testapp.models.ClickCounterModel;
import com.ok.testapp.services.ClickCounterService;
import com.ok.testapp.services.remote.FloxService;
import com.ok.testapp.services.remote.IRemoteService;
import com.ok.testapp.view.screens.IntroScreen;
import com.ok.testapp.view.MainView;
import com.ok.testapp.view.screens.MainScreen;

import flash.display.DisplayObjectContainer;

import robotlegs.bender.bundles.mvcs.MVCSBundle;
import robotlegs.bender.extensions.contextView.ContextView;

import robotlegs.bender.extensions.eventCommandMap.api.IEventCommandMap;
import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;
import robotlegs.bender.framework.impl.Context;
import robotlegs.extensions.starlingViewMap.StarlingViewMapExtension;

import starling.core.Starling;

public class MainConfig {
	private var context : Context;
	private var mediatorMap : IMediatorMap;
	private var commandMap : IEventCommandMap;

	public function MainConfig(rootDisplayObject : DisplayObjectContainer, starling : Starling)
	{
		context = new Context();

		context.install(MVCSBundle, StarlingViewMapExtension);

		context.configure(new ContextView(rootDisplayObject), starling);

		mediatorMap = context.injector.getInstance(IMediatorMap);
		mediatorMap.map(MainView).toMediator(MainViewMediator);

		mediatorMap.map(IntroScreen).toMediator(IntroScreenMediator);
		mediatorMap.map(MainScreen).toMediator(MainScreenMediator);

		commandMap = context.injector.getInstance(IEventCommandMap);

		commandMap.map(ClickCounterEvent.REGISTER_CLICK, ClickCounterEvent).toCommand(RegisterClickCommand);
		commandMap.map(RemoteSaveDateEvent.SAVE_CLICKS, RemoteSaveDateEvent).toCommand(RemoteSaveDateCommand);
		commandMap.map(RemoteSendEventEvent.SEND_EVENT, RemoteSendEventEvent).toCommand(RemoteSendEventCommand);

		context.injector.map(ClickCounterModel).asSingleton();
		context.injector.map(ClickCounterService).asSingleton();
		context.injector.map(IRemoteService).toSingleton(FloxService, true);
	}

	public function destroy() : void
	{
		context = null;
		mediatorMap = null;
		commandMap = null;
	}
}
}
