package com.ok.testapp {

import com.ok.testapp.config.MainConfig;
import com.ok.testapp.view.MainView;

import flash.display.Sprite;
import flash.display.StageAlign;
import flash.display.StageScaleMode;
import flash.events.Event;
import flash.geom.Rectangle;
import flash.text.TextField;

import starling.core.Starling;
import starling.events.ResizeEvent;

public class Main extends Sprite {

	import starling.core.Starling;

	private var starling : Starling;

	private var config : MainConfig;

	public function Main()
	{
		if (stage)
		{
			init();
		}else
		{
			addEventListener(Event.ADDED_TO_STAGE, handleAdded);
		}
	}

	private function handleAdded(event : Event) : void
	{
		removeEventListener(Event.ADDED_TO_STAGE, handleAdded);
		init();
	}

	private function init() : void
	{
		stage.scaleMode = StageScaleMode.NO_SCALE;
		stage.align = StageAlign.TOP_LEFT;

		starling = new Starling(MainView, stage);
		config = new MainConfig(this, starling);
		this.initStarling();
		stage.addEventListener(ResizeEvent.RESIZE, onResize);
	}

	private function onResize(e : flash.events.Event) : void
	{
		var viewPortRectangle : Rectangle = new Rectangle();
		viewPortRectangle.width = stage.stageWidth;
		viewPortRectangle.height = stage.stageHeight;

		Starling.current.viewPort = viewPortRectangle;

		starling.stage.stageWidth = stage.stageWidth;
		starling.stage.stageHeight = stage.stageHeight;
	}

	private function initStarling() : void
	{
		starling.showStats = true;
		starling.antiAliasing = 1;
		starling.start();
	}
}
}
