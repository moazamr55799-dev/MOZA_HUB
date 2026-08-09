local RedzLib = loadstring(game:HttpGet("https://githubusercontent.com"))()
local Win = RedzLib:MakeWindow({Title = "MODZ_HUB | Blox Fruits", SubTitle = "by modz", Discord = "https://discord.gg"})
local T1, T2, T3 = Win:CreateTab("Main", "home"), Win:CreateTab("Teleport", "map-pin"), Win:CreateTab("Fruit Hub", "cherry")
local Farm, Snipe, BuyFruit, StoreFruit, Sea = false, false, false, false, "First Sea"
local SelectWeapon = "Melee"
local P, VU, RS = game.Players.LocalPlayer, game:GetService("VirtualUser"), game:GetService("ReplicatedStorage").Remotes.CommF_

P.Idled:Connect(function() VU:CaptureController() VU:ClickButton2(Vector2.new()) end)

T1:AddToggle({Name = "Auto Farm", Default = false, Callback = function(v) Farm = v end})
T1:AddDropdown({Name = "Select Weapon", Options = {"Melee", "Sword", "Blox Fruit"}, Default = "Melee", Callback = function(v) SelectWeapon = v end})

task.spawn(function()
    while true do task.wait()
        if Farm then pcall(function()
            for _, e in pairs(workspace.Enemies:GetChildren()) do
                if e:FindFirstChild("Humanoid") and e.Humanoid.Health > 0 and e:FindFirstChild("HumanoidRootPart") then
                    local c = P.Character
                    local targetTool = nil
                    if SelectWeapon == "Melee" then targetTool = P.Backpack:FindFirstChild("Combat") or P.Backpack:FindFirstChildOfClass("Tool")
                    elseif SelectWeapon == "Sword" then for _, weapon in pairs(P.Backpack:GetChildren()) do if weapon:IsA("Tool") and weapon.ToolTip == "Sword" then targetTool = weapon break end end
                    elseif SelectWeapon == "Blox Fruit" then for _, weapon in pairs(P.Backpack:GetChildren()) do if weapon:IsA("Tool") and weapon.ToolTip == "Blox Fruit" then targetTool = weapon break end end end
                    if not targetTool and c:FindFirstChildOfClass("Tool") then targetTool = c:FindFirstChildOfClass("Tool") end
                    if targetTool then c.Humanoid:EquipTool(targetTool) end
                    c.HumanoidRootPart.CFrame = e.HumanoidRootPart.CFrame * CFrame.new(0, 10, 0)
                    VU:CaptureController() VU:Button1Down(Vector2.new(1280, 720))
                end
            end
        end) end
    end
end)

T2:AddDropdown({Name = "Select Sea", Options = {"First Sea", "Second Sea", "Third Sea"}, Default = "First Sea", Callback = function(v) Sea = v end})
T2:AddButton({Name = "Teleport to Selected Sea", Callback = function()
    if Sea == "First Sea" then RS:InvokeServer("TravelMain")
    elseif Sea == "Second Sea" then RS:InvokeServer("TravelDressrosa")
    elseif Sea == "Third Sea" then RS:InvokeServer("TravelZou") end
end})

T3:AddToggle({Name = "Auto Bring Fruits", Default = false, Callback = function(v) Snipe = v end})
T3:AddToggle({Name = "Auto Random Gacha Fruit", Default = false, Callback = function(v) BuyFruit = v end})
T3:AddToggle({Name = "Auto Store Fruits", Default = false, Callback = function(v) StoreFruit = v end})

task.spawn(function()
    while true do task.wait(1)
        if Snipe then pcall(function()
            for _, i in pairs(workspace:GetChildren()) do
                if i:IsA("Tool") and i:FindFirstChild("Handle") and P.Character and P.Character:FindFirstChild("HumanoidRootPart") then
                    i.Handle.CFrame = P.Character.HumanoidRootPart.CFrame
                end
            end
        end) end
    end
end)

task.spawn(function()
    while true do task.wait(5)
        if BuyFruit then pcall(function() RS:InvokeServer("Cousin", "BuyFruit") end) end
        if StoreFruit then pcall(function()
            for _, tool in pairs(P.Backpack:GetChildren()) do
                if tool:IsA("Tool") and tool.ToolTip == "Blox Fruit" then
                    RS:InvokeServer("StoreFruit", tool.Name, tool)
                end
            end
        end) end
    end
end)

RedzLib:Notification({Title = "MODZ_HUB", Content = "Script updated successfully with Weapons and Fruit features!", Duration = 5})
