--[[

┌≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈┐
│                                                       │
│  # SWRP                                               │
│                                                       │
│                                                       │
│  Basic progress bar                                   │
│                                                       │
│                                                       │
│  @ Made by Poggu                                      │
│  Contact (discord) : Poggu#5993                       │
│                                                       │
└≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈┘

]]--

function drawBar(time, text, cb, options)
	SendNUIMessage({
		time = time,
		text = text,
		options = options
	})
	if cb then
		Citizen.SetTimeout(time + 100, cb)
	end
end

RegisterNetEvent('pogressBar:drawBar')
AddEventHandler('pogressBar:drawBar', function(time, text, cb, options)
	drawBar(time, text, cb, options)
end)
Citizen.CreateThread(function()
	Citizen.Wait(1000)
	drawBar(500, 'FeelsGoodMan', function()
		print('callback Test')
	end, {
		color = 'green'
	})
	Citizen.Wait(1000)
	drawBar(500, 'fdsfs', function()
		print('callback Test')
	end)
end)


--[[

Examples

Citizen.CreateThread(function()

	drawBar(5000, 'FeelsGoodMan', function()
		print('callback Test')
	end)


	TriggerEvent('pogressBar:drawBar', 1000, 'test', function()
		print('callback Test')
	end)
end)

]]--
