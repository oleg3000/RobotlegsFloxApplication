package com.ok.testapp.mediators {
import com.ok.testapp.events.ViewEvent;
import com.ok.testapp.models.ScreenEnum;
import com.ok.testapp.view.screens.IntroScreen;
import com.ok.testapp.view.MainView;
import com.ok.testapp.view.screens.MainScreen;

import feathers.controls.ScreenNavigatorItem;

import robotlegs.bender.bundles.mvcs.Mediator;

public class MainViewMediator extends Mediator {

	[Inject]
	public var view : MainView;

	public override function initialize() : void
	{
		view.init();
		initScreens();
		initListeners();
		runFirstScreen();
	}

	private function initListeners() : void
	{
		eventDispatcher.addEventListener(ViewEvent.CHANGE_SCREEN, handleViewChange);
	}

	private function initScreens() : void
	{
		view.navigator.addScreen(ScreenEnum.FIRST_SCREEN, new ScreenNavigatorItem(IntroScreen));
		view.navigator.addScreen(ScreenEnum.SECOND_SCREEN, new ScreenNavigatorItem(MainScreen));
	}

	private function runFirstScreen() : void
	{
		eventDispatcher.dispatchEvent(new ViewEvent(ViewEvent.CHANGE_SCREEN, ScreenEnum.FIRST_SCREEN));
	}

	private function handleViewChange(event : ViewEvent) : void
	{
		view.navigator.showScreen(event.viewId);
	}

	public override function destroy () : void
	{
		eventDispatcher.removeEventListener(ViewEvent.CHANGE_SCREEN, handleViewChange);
	}
}
}
