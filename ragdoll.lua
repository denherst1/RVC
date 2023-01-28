local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()
local key = loadstring(game:HttpGet("https://pastebin.com/raw/Gtn8M8mc"))()
local Window = Rayfield:CreateWindow({
Name = "FilaHub - Ragdoll Engine",
LoadingTitle = "Loading up...",
LoadingSubtitle = "by OkHiGuyS",
ConfigurationSaving = {
	Enabled = true,
	FileName = "FilaHub",
},
KeySystem = true, -- Set this to true to use our key system
KeySettings = {
	Title = "FilaHub",
	Subtitle = "Enther the key to continue.",
	Note = "Join the discord server.",
	Key = "discordsrv"
}
})

local lc = Window:CreateTab("LocalPlayer")

local comb = Window:CreateTab("Combat")

local cr = Window:CreateTab("Credits")

local Section = comb:CreateSection("Actually this will help you with hitting someone.")

local Paragraph = cr:CreateParagraph({Title = "Credits", Content = "Made by OkHiGuyS, thank you for using my script!"})

local Button = cr:CreateButton({
	Name = "Copy Discord",
	Callback = function()
		setclipboard("OkHiGuyS#1111")
	end,
})

local Slider = lc:CreateSlider({
	Name = "WalkSpeed",
	Range = {16, 166},
	Increment = 1,
	Suffix = "Speed",
	CurrentValue = 16,
	Flag = "WalkSpeed", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Value)
	    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
	end,
})

local Slider = lc:CreateSlider({
	Name = "JumpPower",
	Range = {50, 250},
	Increment = 1,
	Suffix = "Jump",
	CurrentValue = 50,
	Flag = "JumpPower", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Value)
	    game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
	end,
})

local Button = comb:CreateButton({
	Name = "Anti-Ragdoll",
	Callback = function()
		local plr = game.Players.LocalPlayer.Character

        plr.Pushed.Disabled = true
        plr.RagdollMe.Disabled = true
	end,
})

local Toggle = comb:CreateToggle({
	Name = "Push-Aura (anti ragdoll is required)",
	CurrentValue = false,
	Flag = "PushAura", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Value)
        _G.Aura = Value
        
        while _G.Aura==true do
            wait(0.1)
            p = game.Players:GetChildren()

            for i = 1, #p do

local args = {
    [1] = p[i].Character
}

game:GetService("Players").LocalPlayer.Character.Push.PushTool:FireServer(unpack(args))
end
        end
	end,
})

local Keybind = comb:CreateKeybind({
	Name = "Hit Keybind (anti-ragdoll required)",
	CurrentKeybind = "Q",
	HoldToInteract = false,
	Flag = "HitButton", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Keybind)
        p = game.Players:GetChildren()

for i = 1, #p do

local args = {
    [1] = p[i].Character
}

game:GetService("Players").LocalPlayer.Character.Push.PushTool:FireServer(unpack(args))
end
	end,
})

local Button = lc:CreateButton({
	Name = "Destroy FilaHub",
	Callback = function()
        Rayfield:Destroy()
	end,
})
