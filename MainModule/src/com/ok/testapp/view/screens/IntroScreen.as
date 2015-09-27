package com.ok.testapp.view.screens {
import com.ok.testapp.events.ScreenEvent;

import feathers.controls.Button;
import feathers.controls.PanelScreen;
import feathers.layout.VerticalLayout;

import starling.events.Event;
import starling.events.EventDispatcher;
import starling.events.EventDispatcher;

public class IntroScreen extends PanelScreen {

	private const GO_TO_MAIN_LABEL : String = "Go to Main";
	private const TITLE : String = "Intro screen";

	private var _button : Button;

	public function IntroScreen()
	{
		super();
	}

	protected override function initialize():void
	{
		var layout : VerticalLayout = new VerticalLayout();
		layout.verticalAlign = VerticalLayout.VERTICAL_ALIGN_MIDDLE;
		layout.horizontalAlign = VerticalLayout.HORIZONTAL_ALIGN_CENTER;

		this.layout = layout;
		this.title = TITLE;

		super.initialize();
	}

	public function init() : void
	{
		_button = new Button();
		_button.label = GO_TO_MAIN_LABEL;
		_button.addEventListener(Event.TRIGGERED, handleButtonTriggered);
		_button.validate();
		addChild(_button);
	}

	private function handleButtonTriggered(event : Event) : void
	{
		//IDEA misleadingly interpret 'this' as flash.event.EventDispatcher instead of starling one
		(this as EventDispatcher).dispatchEvent(new ScreenEvent(ScreenEvent.GO_TO_MAIN_TRIGGERED));
	}

	public function destroy () : void
	{
		removeChild(_button);
		_button.removeEventListener(ScreenEvent.GO_TO_MAIN_TRIGGERED, handleButtonTriggered);
		_button = null;
	}
}
}
