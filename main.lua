local event = CreateFrame("Frame")
event:SetScript("OnEvent", function(self, event, ...) self[event](self, event, ...) end)
event:RegisterEvent"UI_ERROR_MESSAGE"

event.UI_ERROR_MESSAGE = function(self, event, ...)
	local err = ...;
	local adf = GetCVarBool("autoDismountFlying");
	if(err == SPELL_FAILED_NOT_MOUNTED or err == ERR_TAXIPLAYERALREADYMOUNTED) then
		if adf and IsFlying() then
			return;
		else
			Dismount();
		end
	end
end
