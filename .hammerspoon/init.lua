hs.hotkey.bind({ "alt" }, "space", function()
	local appName = "ghostty"
	local ghostty = hs.application.find(appName)

	if ghostty == nil then
		hs.application.launchOrFocus(appName)
	elseif ghostty:title() ~= "Ghostty" then
		-- ghosttyが起動していないときにGhosttyの情報がHitする場合があるのでGhosttyと完全一致しない場合は起動
		hs.application.launchOrFocus(appName)
	elseif ghostty:isFrontmost() then
		ghostty:hide()
	else
		hs.application.launchOrFocus(appName)
	end
end)
