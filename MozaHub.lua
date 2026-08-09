-- ==========================================
-- 🛠️ SCRIPT NAME: Moza Hub (All-In-One Edition)
-- 👤 CREATOR: Moza
-- 📱 COMPATIBILITY: Delta Executor (Mobile/PC)
-- ==========================================

local OrionLib = loadstring(game:HttpGet(('https://githubusercontent.com')))()

local Window = OrionLib:MakeWindow({
    Name = "🔥 Moza Hub | Universal Admin v2.0", 
    HidePremium = false, 
    SaveConfig = false, 
    ConfigFolder = "MozaHubAllInOne"
})

-- متغيرات التحكم
local Speed = 16
local Jump = 50
local Gravity = 196.2
local InfJump = false
local Noclip = false

-- 1. تبويب الشخصية
local PlayerTab = Window:MakeTab({Name = "⚡ الشخصية", Icon = "rbxassetid://4483345998"})

PlayerTab:AddSlider({
    Name = "السرعة (Speed)", Min = 16, Max = 500, Default = 16, Increment = 1, ValueName = "سرعة",
    Callback = function(v) Speed = v end
})

PlayerTab:AddSlider({
    Name = "قوة القفز (Jump Power)", Min = 50, Max = 500, Default = 50, Increment = 1, ValueName = "قفز",
    Callback = function(v) Jump = v end
})

PlayerTab:AddSlider({
    Name = "الجاذبية (Gravity)", Min = 0, Max = 196, Default = 196, Increment = 1, ValueName = "جاذبية",
    Callback = function(v) game.Workspace.Gravity = v end
})

PlayerTab:AddToggle({
    Name = "قفز لانهائي في الهواء (Inf Jump)", Default = false,
    Callback = function(v) InfJump = v end
})

-- 2. تبويب الميزات المتقدمة
local CombatTab = Window:MakeTab({Name = "🛠️ ميزات خارقة", Icon = "rbxassetid://4483345998"})

CombatTab:AddButton({
    Name = "تفعيل الطيران (Fly) - اضغط E أو زر القفز",
    Callback = function()
        -- كود طيران مبسط ومحمي لـ دلتا
        pcall(function() loadstring(game:HttpGet("https://githubusercontent.com"))() end)
    end
})

CombatTab:AddToggle({
    Name = "اختراق الجدران (Noclip)", Default = false,
    Callback = function(v) Noclip = v end
})

CombatTab:AddButton({
    Name = "رؤية اللاعبين خلف الجدران (ESP / Wallhack)",
    Callback = function()
        -- تشغيل كود ESP عالمي آمن
        pcall(function() loadstring(game:HttpGet("https://githubusercontent.com"))() end)
    end
})

-- الحلقات البرمجية لتشغيل الميزات بشكل مستمر وثابت
task.spawn(function()
    game:GetService("RunService").Stepped:Connect(function()
        pcall(function()
            local char = game.Players.LocalPlayer.Character
            if char then
                -- السرعة والقفز
                if char:FindFirstChild("Humanoid") then
                    char.Humanoid.WalkSpeed = Speed
                    char.Humanoid.JumpPower = Jump
                end
                -- اختراق الجدران
                if Noclip then
                    for _, child in pairs(char:GetChildren()) do
                        if child:IsA("BasePart") then child.CanCollide = false end
                    end
                end
            end
        end)
    end)
end)

-- كود القفز اللانهائي
game:GetService("UserInputService").JumpRequest:Connect(function()
    if InfJump then
        pcall(function()
            game.Players.LocalPlayer.Character.Humanoid:ChangeState("Jumping")
        end)
    end
end)

-- إشعار التشغيل لـ Moza Hub
OrionLib:MakeNotification({
    Name = "👑 Moza Hub Loaded!",
    Content = "تم تفعيل النسخة الشاملة بنجاح على دلتا.",
    Image = "rbxassetid://4483345998",
    Time = 6
})
