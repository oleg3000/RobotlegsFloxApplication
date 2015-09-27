package com.ok.testapp.view {
import feathers.controls.Drawers;
import feathers.controls.ScreenNavigator;
import feathers.themes.MinimalMobileTheme;

import starling.display.Sprite;

public class MainView extends Drawers {

	public var navigator : ScreenNavigator;

	public function MainView()
	{
		super();
	}

	public function init() : void
	{
		new MinimalMobileTheme();

		navigator = new ScreenNavigator();
		this.content = navigator;
	}

	public function destroy() : void
	{
		removeChild(navigator);
		navigator = null;
	}


}
}
