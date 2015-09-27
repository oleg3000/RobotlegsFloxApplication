package com.ok.testapp.mediators.screens {
import com.ok.testapp.events.ClickCounterEvent;
import com.ok.testapp.events.remote.RemoteSendEventEvent;
import com.ok.testapp.events.ScreenEvent;
import com.ok.testapp.events.ViewEvent;
import com.ok.testapp.models.ClickCounterModel;
import com.ok.testapp.models.RemoteEventsEnum;
import com.ok.testapp.models.ScreenEnum;
import com.ok.testapp.view.screens.IntroScreen;

import flash.events.Event;

import robotlegs.bender.bundles.mvcs.Mediator;
import robotlegs.bender.extensions.mediatorMap.api.IMediator;

public class IntroScreenMediator extends Mediator implements IMediator{

	[Inject]
	public var view : IntroScreen;

	[Inject]
	public var clickCounterModel : ClickCounterModel;

	public function IntroScreenMediator()
	{
		super();
	}

	public override function initialize () : void
	{
		view.init();

		view.addEventListener(ScreenEvent.GO_TO_MAIN_TRIGGERED, handleGoToMainTriggered);
	}

	private function handleGoToMainTriggered(event : ScreenEvent) : void
	{
		dispatch(new ClickCounterEvent(ClickCounterEvent.REGISTER_CLICK));
		dispatch(new RemoteSendEventEvent(RemoteSendEventEvent.SEND_EVENT,
				RemoteEventsEnum.GO_MAIN_CLICKED, clickCounterModel.counter));
		dispatch(new ViewEvent(ViewEvent.CHANGE_SCREEN, ScreenEnum.SECOND_SCREEN));
	}

	public override function destroy () : void
	{
		view.destroy();

		view.removeEventListener(ScreenEvent.GO_TO_MAIN_TRIGGERED, handleGoToMainTriggered);
	}
}
}
