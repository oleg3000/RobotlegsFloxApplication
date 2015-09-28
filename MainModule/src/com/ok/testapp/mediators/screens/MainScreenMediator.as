package com.ok.testapp.mediators.screens {
import com.ok.testapp.events.remote.RemoteSaveDateEvent;
import com.ok.testapp.events.remote.RemoteSendEventEvent;
import com.ok.testapp.events.ScreenEvent;
import com.ok.testapp.events.ViewEvent;
import com.ok.testapp.models.ClickCounterModel;
import com.ok.testapp.models.RemoteEventsEnum;
import com.ok.testapp.models.ScreenEnum;
import com.ok.testapp.view.screens.MainScreen;

import robotlegs.bender.bundles.mvcs.Mediator;

public class MainScreenMediator extends Mediator {

	[Inject]
	public var view : MainScreen;

	[Inject]
	public var clickCounterModel : ClickCounterModel;

	public function MainScreenMediator()
	{
		super();
	}

	public override function initialize () : void
	{
		view.init();

		view.addEventListener(ScreenEvent.GO_TO_INTRO_TRIGGERED, handleGoToIntroTriggered);
		view.addEventListener(ScreenEvent.SAVE_CLICKS_TRIGGERED, handleSaveClicksTriggered);
	}

	private function handleGoToIntroTriggered(event : ScreenEvent) : void
	{
		dispatch(new RemoteSendEventEvent(RemoteSendEventEvent.SEND_EVENT, RemoteEventsEnum.GO_INTRO_CLICKED));
		dispatch(new ViewEvent(ViewEvent.CHANGE_SCREEN, ScreenEnum.FIRST_SCREEN));
	}

	private function handleSaveClicksTriggered(event : ScreenEvent) : void
	{
		dispatch(new RemoteSaveDateEvent(RemoteSaveDateEvent.SAVE_DATE));
	}

	public override function destroy () : void
	{
		view.destroy();

		view.removeEventListener(ScreenEvent.GO_TO_INTRO_TRIGGERED, handleGoToIntroTriggered);
		view.removeEventListener(ScreenEvent.SAVE_CLICKS_TRIGGERED, handleSaveClicksTriggered);
	}
}
}
