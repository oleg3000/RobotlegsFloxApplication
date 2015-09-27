package com.ok.testapp.services {
import com.ok.testapp.models.ClickCounterModel;

public class ClickCounterService {

	[Inject]
	public var model : ClickCounterModel;

	public function count() : void
	{
		model.counter++;
	}
}
}
