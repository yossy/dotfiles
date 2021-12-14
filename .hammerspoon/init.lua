hs.hotkey.bind({"alt"}, "space", function()
  local appName = "alacritty"
  local alacritty = hs.application.find(appName)

  if alacritty == nil then
    hs.application.launchOrFocus(appName)
  elseif alacritty:title() ~= 'Alacritty' then
    -- alacrittyが起動していないときにAlacrittyの情報がHitする場合があるのでAlacrittyと完全一致しない場合は起動
    hs.application.launchOrFocus(appName)
  elseif alacritty:isFrontmost() then
    alacritty:hide()
  else
    hs.application.launchOrFocus(appName)
  end
end)
