--[[
This work is licensed under a Creative Commons Attribution-ShareAlike 3.0 Unported License.
	http://creativecommons.org/licenses/by-sa/3.0/
Absolutely no warranties or guarantees given or implied - use at your own risk
Copyright (C) 2012 ChickenKatsu All Rights Reserved. http://www.chickenkatsu.co.uk/
--]]
require "inc.lib.lib-toggle"
require "inc.lib.lib-class"
require ("inc.lib.lib-debug")

cButtonWidget = { delay=250,  eventName = "onPress" }

--*******************************************************
function cButtonWidget:create( psSprite, piWidth, piHeight)
	cDebug:print(DEBUG__DEBUG, "cButtonWidget:create");
	
	local oInstance = cToggleWidget:create(psSprite, piWidth, piHeight)
	cClass.addParent(oInstance, cButtonWidget)
	oInstance:addListener("onToggle", oInstance)
	return oInstance 
end

--*******************************************************
function cButtonWidget:onToggle(poEvent)
	cDebug:print(DEBUG__DEBUG, "cButtonWidget:onToggle");
	if poEvent.toggled then
		cDebug:print(DEBUG__EXTRA_DEBUG, "cButtonWidget: timer started");
		timer.performWithDelay(self.delay, self,1)
	end
	return true
end

--*******************************************************
function cButtonWidget:timer(poEvent)
	cDebug:print(DEBUG__EXTRA_DEBUG, "cButtonWidget: timer fired");
	self:notify({ name=self.eventName, state=poEvent.state, target=self})
	cDebug:print(DEBUG__EXTRA_DEBUG, "setting state");
	self:toggle(false)
end
