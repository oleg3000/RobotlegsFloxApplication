package com.ok.testapp.view.screens {
import com.ok.testapp.events.ScreenEvent;

import feathers.controls.Button;
import feathers.controls.PanelScreen;
import feathers.layout.VerticalLayout;

import starling.events.Event;
import starling.events.EventDispatcher;

public class MainScreen extends PanelScreen {
	
	private const GO_TO_INTRO_LABEL : String = "Go to intro";
	private const SAVE_LABEL : String = "Save";
	private const TITLE : String = "Main screen";
	private const GAP : Number = 25;

	private var _introButton : Button;
	private var _saveButton : Button;

	public function MainScreen()
	{
		super();
	}

	protected override function initialize():void
	{
		var layout : VerticalLayout = new VerticalLayout();
		layout.verticalAlign = VerticalLayout.VERTICAL_ALIGN_MIDDLE;
		layout.horizontalAlign = VerticalLayout.HORIZONTAL_ALIGN_CENTER;
		layout.gap = GAP;

		this.layout = layout;
		this.title = TITLE;
	}

	public function init() : void
	{
		_introButton = new Button();
		_introButton.label = GO_TO_INTRO_LABEL;
		_introButton.addEventListener(Event.TRIGGERED, handleIntroButtonTriggered);

		_saveButton = new Button();
		_saveButton.label = SAVE_LABEL;
		_saveButton.addEventListener(Event.TRIGGERED, handleSaveButtonTriggered);

		addChild(_introButton);
		addChild(_saveButton);
	}

	private function handleIntroButtonTriggered(event : Event) : void
	{
		//IDEA misleadingly interpret 'this' as flash.event.EventDispatcher instead of starling one
		(this as EventDispatcher).dispatchEvent(new ScreenEvent(ScreenEvent.GO_TO_INTRO_TRIGGERED));
	}

	private function handleSaveButtonTriggered(event : Event) : void
	{
		//IDEA misleadingly interpret 'this' as flash.event.EventDispatcher instead of starling one
		(this as EventDispatcher).dispatchEvent(new ScreenEvent(ScreenEvent.SAVE_CLICKS_TRIGGERED));
	}

	public function destroy () : void
	{
		removeChild(_introButton);
		removeChild(_saveButton);
		_introButton.removeEventListener(ScreenEvent.GO_TO_MAIN_TRIGGERED, handleIntroButtonTriggered);
		_saveButton.removeEventListener(ScreenEvent.GO_TO_MAIN_TRIGGERED, handleSaveButtonTriggered);
		_introButton = null;
		_saveButton = null;
	}
}
}
