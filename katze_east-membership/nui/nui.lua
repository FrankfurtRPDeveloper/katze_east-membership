-- Copyright Katze Scripts 2023

local display = false

RegisterCommand("eastmenutest", function(source)
    setDisplay(not display)
end)

RegisterNUICallback("main", function(data)
    chat(data.text, {0,255,0})
    setDisplay(false)
end)

RegisterNUICallback("error", function(data)
    chat(data.error, {255,0,0})
    SetDisplay(false)
end)

RegisterNUICallback("exit", function(data)
    chat("Exited", {0,255,0})
    setDisplay(false)
end)

Citizen.CreateThread(function()
    while display do
        Citizen.Wait(0)
    
    DisableControlAction(0, 1, display)
    DisableControlAction(0, 2, display)
    DisableControlAction(0, 142, display)
    DisableControlAction(0, 18, display)
    DisableControlAction(0, 322, display)
    DisableControlAction(0, 106, display)
    end
end)

function setDisplay(bool)
    display = bool
    SetNuiFocus(bool, bool)
    SendNUIMessage({
        type="ui",
        status = bool,
    })
end

function chat(str, color)
    TriggerEvent("chat:addMessage", {
        color = color,
        multiline= true,
        args = {str}
)}
end
