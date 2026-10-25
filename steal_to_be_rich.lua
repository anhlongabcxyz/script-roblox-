local P, T, U = game:GetService("Players"), game:GetService("TweenService"), game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")
local LP = P.LocalPlayer
local PC = gethui and gethui() or (pcall(function() Instance.new("Folder", game:GetService("CoreGui")):Destroy() end) and game:GetService("CoreGui")) or LP:WaitForChild("PlayerGui")
local w, h, o, m, b = 750, 480, true, false, false

if PC:FindFirstChild("CustomBigMenuGui") then PC.CustomBigMenuGui:Destroy() end

local function C(k, p, c)
	local i = Instance.new(k) for a, b in pairs(p or {}) do i[a] = b end
	for _, x in ipairs(c or {}) do x.Parent = i end return i
end
local function K(r) return C("UICorner", {CornerRadius = UDim.new(0, r)}) end
local function S(c, t) return C("UIStroke", {Color = c, Thickness = t or 1, Transparency = 0.3}) end

local SG = C("ScreenGui", {Name = "CustomBigMenuGui", ResetOnSpawn = false, Parent = PC}, {
	C("Frame", {Name = "Main", Size = UDim2.new(0, w, 0, h), Position = UDim2.new(0.5, -375, 0.5, -240), BackgroundColor3 = Color3.fromRGB(10, 12, 20), BackgroundTransparency = 0.3, BorderSizePixel = 0, ClipsDescendants = true}, {
		K(14), S(Color3.fromRGB(255, 255, 255), 1.5),
		C("Frame", {Name = "MainContainer", Size = UDim2.new(1, 0, 1, 0), BackgroundTransparency = 1, ClipsDescendants = true}, {
			K(14),
			C("Frame", {Name = "Bar", Size = UDim2.new(1, 0, 0, 50), BackgroundColor3 = Color3.fromRGB(15, 20, 35), BackgroundTransparency = 0.4, ZIndex = 5}, {
				K(14),
				C("TextLabel", {Size = UDim2.new(1, 0, 1, 0), BackgroundTransparency = 1, Text = "  anh✧long steal to be rich", TextColor3 = Color3.fromRGB(255, 255, 255), TextSize = 22, Font = Enum.Font.Garamond, TextXAlignment = Enum.TextXAlignment.Left, ZIndex = 6}),
				C("TextLabel", {Size = UDim2.new(0, 100, 1, 0), Position = UDim2.new(1, -190, 0, 0), BackgroundTransparency = 1, Text = "v0.1", TextColor3 = Color3.fromRGB(0, 200, 255), TextSize = 16, Font = Enum.Font.GothamBold, TextXAlignment = Enum.TextXAlignment.Right, ZIndex = 6}),
				C("TextButton", {Name = "X", Size = UDim2.new(0, 32, 0, 32), Position = UDim2.new(1, -42, 0.5, -16), BackgroundColor3 = Color3.fromRGB(235, 55, 55), BackgroundTransparency = 0.4, Text = "X", TextColor3 = Color3.fromRGB(255, 255, 255), Font = Enum.Font.GothamBold, TextSize = 15, ZIndex = 25}, {K(8), S(Color3.fromRGB(255, 180, 180), 1.5)}),
				C("TextButton", {Name = "M", Size = UDim2.new(0, 32, 0, 32), Position = UDim2.new(1, -80, 0.5, -16), BackgroundColor3 = Color3.fromRGB(50, 70, 100), BackgroundTransparency = 0.4, Text = "—", TextColor3 = Color3.fromRGB(255, 255, 255), Font = Enum.Font.GothamBold, TextSize = 15, ZIndex = 25}, {K(8), S(Color3.fromRGB(180, 210, 255), 1.5)})
			}),
			C("Frame", {Name = "Cnt", Size = UDim2.new(1, -24, 1, -64), Position = UDim2.new(0, 12, 0, 56), BackgroundTransparency = 1, ZIndex = 3}),
			C("Frame", {Name = "InfoPanel", Size = UDim2.new(1, -24, 1, -64), Position = UDim2.new(0, 12, 0, 56), BackgroundColor3 = Color3.fromRGB(10, 12, 20), BackgroundTransparency = 0.3, Visible = false, ZIndex = 3}, {K(10), S(Color3.fromRGB(255, 255, 255), 1)}),
			C("Frame", {Name = "SettingsPanel", Size = UDim2.new(1, -24, 1, -64), Position = UDim2.new(0, 12, 0, 56), BackgroundColor3 = Color3.fromRGB(10, 12, 20), BackgroundTransparency = 0.3, Visible = false, ZIndex = 3}, {K(10), S(Color3.fromRGB(255, 255, 255), 1)})
		})
	}),
	C("ImageButton", {Name = "Ico", Size = UDim2.new(0, 60, 0, 60), Position = UDim2.new(0, 20, 0.5, -30), BackgroundColor3 = Color3.fromRGB(30, 40, 55), BackgroundTransparency = 0.5, Visible = false}, {
		K(30), S(Color3.fromRGB(255, 255, 255), 2),
		C("TextLabel", {Size = UDim2.new(1, 0, 1, 0), BackgroundTransparency = 1, Text = "✧", TextColor3 = Color3.fromRGB(255, 255, 255), TextSize = 42, Font = Enum.Font.Garamond, ZIndex = 2})
	})
})

local M, I, B = SG.Main, SG.Ico, SG.Main.MainContainer.Bar
local Cnt, IP, SP = M.MainContainer.Cnt, M.MainContainer.InfoPanel, M.MainContainer.SettingsPanel

local function SB(p, t, o, cb)
	local f = C("Frame", {Size = UDim2.new(1, -12, 0, 44), BackgroundColor3 = Color3.fromRGB(20, 25, 40), BackgroundTransparency = 0.4, LayoutOrder = o, ZIndex = 5, Parent = p}, {K(10), S(Color3.fromRGB(255, 255, 255), 1)})
	local b = C("TextButton", {Size = UDim2.new(1, -6, 1, -6), Position = UDim2.new(0, 3, 0, 3), BackgroundColor3 = Color3.fromRGB(12, 15, 25), BackgroundTransparency = 0.4, Text = t, TextColor3 = Color3.fromRGB(255, 255, 255), Font = Enum.Font.Gotham, TextSize = 12, ZIndex = 6, Parent = f}, {K(8), S(Color3.fromRGB(255, 255, 255), 0.9)})
	if cb then b.MouseButton1Click:Connect(cb) end
	return b
end

local function DB(p, t, o, cb)
	local f = C("Frame", {Size = UDim2.new(1, 0, 0, 48), BackgroundColor3 = Color3.fromRGB(88, 101, 242), BackgroundTransparency = 0.3, LayoutOrder = o, ZIndex = 5, Parent = p}, {K(10), S(Color3.fromRGB(200, 210, 255), 1)})
	local b = C("TextButton", {Size = UDim2.new(1, -6, 1, -6), Position = UDim2.new(0, 3, 0, 3), BackgroundColor3 = Color3.fromRGB(45, 52, 130), BackgroundTransparency = 0.4, Text = "", ZIndex = 6, Parent = f}, {K(8), S(Color3.fromRGB(200, 210, 255), 0.9)})
	C("TextLabel", {Parent = b, Size = UDim2.new(0, 24, 1, 0), Position = UDim2.new(0, 6, 0, 0), BackgroundTransparency = 1, Text = "💬", TextSize = 15, Font = Enum.Font.SourceSansBold, ZIndex = 7})
	C("TextLabel", {Parent = b, Size = UDim2.new(1, -34, 1, 0), Position = UDim2.new(0, 30, 0, 0), BackgroundTransparency = 1, Text = t, TextColor3 = Color3.fromRGB(255, 255, 255), Font = Enum.Font.GothamBold, TextSize = 13, TextXAlignment = Enum.TextXAlignment.Left, ZIndex = 7})
	if cb then b.MouseButton1Click:Connect(cb) end
	return b
end

Cnt:ClearAllChildren()
local CW = C("Frame", {Size = UDim2.new(0.25, 0, 1, 0), BackgroundTransparency = 1, ZIndex = 2, Parent = Cnt}, {C("UIPadding", {PaddingTop = UDim.new(0, 4), PaddingBottom = UDim.new(0, 4), PaddingLeft = UDim.new(0, 4), PaddingRight = UDim.new(0, 4)})})
local C1B = C("Frame", {Size = UDim2.new(1, 0, 1, 0), BackgroundColor3 = Color3.fromRGB(22, 30, 50), BackgroundTransparency = 0.3, ClipsDescendants = true, ZIndex = 3, Parent = CW}, {K(10), S(Color3.fromRGB(255, 255, 255), 1)})
local RP = C("Frame", {Name = "MainRightPanel", Parent = Cnt, Position = UDim2.new(0.25, 8, 0, 0), Size = UDim2.new(0.75, -8, 1, 0), BackgroundColor3 = Color3.fromRGB(22, 30, 50), BackgroundTransparency = 0.3, BorderSizePixel = 0, ZIndex = 3}, {
    K(10), S(Color3.fromRGB(255, 255, 255), 1),
    C("TextLabel", {Name = "Title", Parent = nil, Size = UDim2.new(1, -24, 0, 30), Position = UDim2.new(0, 12, 0, 10), BackgroundTransparency = 1, Text = "Điều khiển nhanh", TextColor3 = Color3.fromRGB(255, 255, 255), TextSize = 17, Font = Enum.Font.GothamBold, TextXAlignment = Enum.TextXAlignment.Left, ZIndex = 5}),
    C("TextLabel", {Name = "Hint", Size = UDim2.new(1, -24, 0, 34), Position = UDim2.new(0, 12, 0, 38), BackgroundTransparency = 1, Text = "Bật hoặc tắt chức năng tại đây.", TextColor3 = Color3.fromRGB(180, 190, 210), TextSize = 12, Font = Enum.Font.Gotham, TextXAlignment = Enum.TextXAlignment.Left, TextWrapped = true, ZIndex = 5})
})
-- Gắn nhãn vào panel sau khi tạo để tránh phụ thuộc thứ tự tạo con.
RP.Title.Parent, RP.Hint.Parent = RP, RP
local C1 = C("ScrollingFrame", {Size = UDim2.new(1, 0, 1, 0), BackgroundTransparency = 1, ScrollBarThickness = 3, ZIndex = 4, Parent = C1B}, {
	C("UIListLayout", {SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0, 8), HorizontalAlignment = Enum.HorizontalAlignment.Center}),
	C("UIPadding", {PaddingTop = UDim.new(0, 6), PaddingBottom = UDim.new(0, 6), PaddingLeft = UDim.new(0, 6), PaddingRight = UDim.new(0, 6)})
})

SB(C1, "cài đặt", 1, function() Cnt.Visible, IP.Visible, SP.Visible = false, false, true end)
SB(C1, "thông tin", 2, function() Cnt.Visible, SP.Visible, IP.Visible = false, false, true end)
task.defer(function() pcall(function() C1.CanvasSize = UDim2.new(0, 0, 0, C1.UIListLayout.AbsoluteContentSize.Y + 12) end) end)

local function CH(p, t, cb)
	local hf = C("Frame", {Parent = p, Size = UDim2.new(1, 0, 0, 40), BackgroundTransparency = 1, ZIndex = 5}, {
		C("TextLabel", {Size = UDim2.new(1, -120, 1, 0), Position = UDim2.new(0, 115, 0, 0), BackgroundTransparency = 1, Text = t, TextColor3 = Color3.fromRGB(255, 255, 255), TextSize = 14, Font = Enum.Font.GothamBold, TextXAlignment = Enum.TextXAlignment.Left})
	})
	local bb = SB(hf, "< Quay lại", 1, cb)
	bb.Parent.Size, bb.Parent.Position = UDim2.new(0, 95, 0, 32), UDim2.new(0, 6, 0, 4)
end

CH(SP, "Giao diện", function() SP.Visible, Cnt.Visible = false, true end)
CH(IP, "Phiên bản beta v0.3", function() IP.Visible, Cnt.Visible = false, true end)

local AA, EA, CA = false, false, false
local VirtualUser = game:GetService("VirtualUser")

local function CR(p, y, t, width)
	local r = C("Frame", {Parent = p, Size = UDim2.new(0, width or 160, 0, 38), Position = UDim2.new(0, 6, 0, y), BackgroundColor3 = Color3.fromRGB(20, 25, 40), BackgroundTransparency = 0.4, ZIndex = 5}, {
		K(10), S(Color3.fromRGB(255, 255, 255), 1),
		C("TextLabel", {Size = UDim2.new(0, 85, 1, 0), Position = UDim2.new(0, 12, 0, 0), BackgroundTransparency = 1, Text = t, TextColor3 = Color3.fromRGB(255, 255, 255), Font = Enum.Font.GothamBold, TextSize = 13, TextXAlignment = Enum.TextXAlignment.Left, ZIndex = 7})
	})
	local st = C("TextButton", {Parent = r, Size = UDim2.new(0, 46, 0, 22), Position = UDim2.new(1, -54, 0.5, -11), BackgroundColor3 = Color3.fromRGB(60, 65, 80), Text = "", ZIndex = 7}, {K(11), S(Color3.fromRGB(150, 150, 150), 1)})
	local sm = C("Frame", {Parent = st, Size = UDim2.new(0, 18, 0, 18), Position = UDim2.new(0, 2, 0.5, -9), BackgroundColor3 = Color3.fromRGB(255, 255, 255), ZIndex = 8}, {K(9)})
	return st, sm
end

local ST1, SM1 = CR(SP, 45, "Anti AFK")
ST1.MouseButton1Click:Connect(function()
	AA = not AA
	T:Create(SM1, TweenInfo.new(0.2), {Position = AA and UDim2.new(1, -20, 0.5, -9) or UDim2.new(0, 2, 0.5, -9)}):Play()
	T:Create(ST1, TweenInfo.new(0.2), {BackgroundColor3 = AA and Color3.fromRGB(46, 204, 113) or Color3.fromRGB(60, 65, 80)}):Play()
end)

-- Anti AFK chuẩn
LP.Idled:Connect(function()
	if AA then
		pcall(function()
			VirtualUser:CaptureController()
			VirtualUser:ClickButton2(Vector2.new())
		end)
	end
end)

local ST2, SM2 = CR(SP, 90, "ESP Player")
local ST3, SM3 = CR(RP, 82, "Nhặt rác", 210)
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local StoreEvent = ReplicatedStorage:WaitForChild("Network"):WaitForChild("Items"):WaitForChild("Store")
local processingIds = {}

CA = false
ST3.Active, ST3.Visible = true, true

ST3.MouseButton1Click:Connect(function()
    CA = not CA
    T:Create(SM3, TweenInfo.new(.2), {
        Position = CA and UDim2.new(1,-20,.5,-9) or UDim2.new(0,2,.5,-9)
    }):Play()
    T:Create(ST3, TweenInfo.new(.2), {
        BackgroundColor3 = CA and Color3.fromRGB(46,204,113) or Color3.fromRGB(60,65,80)
    }):Play()
end)

task.spawn(function()
    while SG.Parent do
        if CA then
            local d = Workspace:FindFirstChild("Debris")
            local f = d and d:FindFirstChild("Items")
            if f then
                for _, item in ipairs(f:GetChildren()) do
                    if not CA then break end
                    local id = item:GetAttribute("UniqueId")
                    if id and not processingIds[id] then
    processingIds[id] = true
    task.spawn(function()
        local ok = pcall(function()
            StoreEvent:InvokeServer(id, true)
        end)
        processingIds[id] = nil
    end)
						end
                end
            end
        end
        task.wait(.75)
    end
end)
				
local function ClearESP(char)
	if not char then return end
	local h = char:FindFirstChild("CustomESP_HL")
	local bill = char:FindFirstChild("CustomESP_Bill")
	if h then h:Destroy() end
	if bill then bill:Destroy() end
end

local function MakeESP(plr)
	local char = plr.Character
	if not char then return end
	local head = char:FindFirstChild("Head")
	local hum = char:FindFirstChildOfClass("Humanoid")
	if not head then return end

	if not char:FindFirstChild("CustomESP_HL") then
		C("Highlight", {
			Name = "CustomESP_HL",
			Adornee = char,
			FillColor = Color3.fromRGB(0, 200, 255),
			FillTransparency = 0.55,
			OutlineColor = Color3.fromRGB(255, 255, 255),
			OutlineTransparency = 0,
			DepthMode = Enum.HighlightDepthMode.AlwaysOnTop,
			Parent = char
		})
	end

	if not char:FindFirstChild("CustomESP_Bill") then
		local bb = C("BillboardGui", {
			Name = "CustomESP_Bill",
			Adornee = head,
			Size = UDim2.new(0, 90, 0, 42),
			StudsOffset = Vector3.new(0, 2.8, 0),
			AlwaysOnTop = true,
			MaxDistance = 800,
			Parent = char
		})

		-- Icon ✧ đỏ
		C("TextLabel", {
			Name = "Star",
			Parent = bb,
			Size = UDim2.new(1, 0, 0, 24),
			Position = UDim2.new(0, 0, 0, 0),
			BackgroundTransparency = 1,
			Text = "✧",
			TextColor3 = Color3.fromRGB(255, 35, 35),
			TextStrokeColor3 = Color3.fromRGB(60, 0, 0),
			TextStrokeTransparency = 0.25,
			TextSize = 22,
			Font = Enum.Font.Garamond,
			ZIndex = 10
		})

		-- Tên người chơi (bé)
		C("TextLabel", {
			Name = "NameTag",
			Parent = bb,
			Size = UDim2.new(1, 0, 0, 14),
			Position = UDim2.new(0, 0, 0, 24),
			BackgroundTransparency = 1,
			Text = plr.DisplayName or plr.Name,
			TextColor3 = Color3.fromRGB(255, 255, 255),
			TextStrokeColor3 = Color3.fromRGB(0, 0, 0),
			TextStrokeTransparency = 0.4,
			TextSize = 10,
			Font = Enum.Font.Gotham,
			ZIndex = 10
		})
	end
end

local function UESP()
	for _, plr in ipairs(P:GetPlayers()) do
		if plr ~= LP then
			if EA and plr.Character then
				MakeESP(plr)
			elseif plr.Character then
				ClearESP(plr.Character)
			end
		end
	end
end

-- Tự gắn lại ESP khi người chơi respawn
local function HookPlayer(plr)
	if plr == LP then return end
	plr.CharacterAdded:Connect(function()
		task.wait(0.4)
		if EA then MakeESP(plr) end
	end)
	plr.CharacterRemoving:Connect(function(char)
		ClearESP(char)
	end)
end

for _, plr in ipairs(P:GetPlayers()) do HookPlayer(plr) end
P.PlayerAdded:Connect(HookPlayer)
P.PlayerRemoving:Connect(function(plr)
	if plr.Character then ClearESP(plr.Character) end
end)

ST2.MouseButton1Click:Connect(function()
	EA = not EA
	T:Create(SM2, TweenInfo.new(0.2), {Position = EA and UDim2.new(1, -20, 0.5, -9) or UDim2.new(0, 2, 0.5, -9)}):Play()
	T:Create(ST2, TweenInfo.new(0.2), {BackgroundColor3 = EA and Color3.fromRGB(46, 204, 113) or Color3.fromRGB(60, 65, 80)}):Play()
	UESP()
end)

task.spawn(function()
	while true do
		task.wait(1.2)
		if EA then UESP() end
	end
end)

local function J()
	pcall(function() local c = LP.Character if c then local h = c:FindFirstChildOfClass("Humanoid") if h then h:ChangeState(Enum.HumanoidStateType.Jumping) end end end)
end
LP.Idled:Connect(function() if AA then J() end end)
task.spawn(function() while true do task.wait(60) if AA then J() end end end)

local BD = DB(IP, "Discord", 2, function()
	local l = "https://discord.gg/abPKxgQ4Jf"
	if setclipboard then setclipboard(l) elseif toclipboard then toclipboard(l) end
end)
BD.Parent.Size, BD.Parent.Position = UDim2.new(0, 95, 0, 32), UDim2.new(1, -101, 0, 4)

local IS = C("ScrollingFrame", {Parent = IP, Size = UDim2.new(1, -16, 1, -50), Position = UDim2.new(0, 8, 0, 45), BackgroundTransparency = 1, ScrollBarThickness = 3, ZIndex = 5}, {
	C("UIGridLayout", {CellSize = UDim2.new(0.5, -6, 0, 46), CellPadding = UDim2.new(0, 8, 0, 8)}),
	C("UIPadding", {PaddingTop = UDim.new(0, 4), PaddingLeft = UDim.new(0, 2), PaddingRight = UDim.new(0, 2)})
})

for i, v in ipairs({{"khởi đầu", "Giao diện ", "Menu thiết kế trong suốt."}, {"0.0.1", "Menu Cài Đặt", "giao diện đơn giản."}}) do
	C("Frame", {Parent = IS, BackgroundColor3 = Color3.fromRGB(20, 25, 40), BackgroundTransparency = 0.5, LayoutOrder = i, ZIndex = 6}, {
		K(6), S(Color3.fromRGB(255, 255, 255), 1),
		C("TextLabel", {Size = UDim2.new(1, -12, 0, 20), Position = UDim2.new(0, 6, 0, 4), BackgroundTransparency = 1, Text = '<font color="rgb(150,200,255)">[' .. v[1] .. "]</font> " .. v[2], TextColor3 = Color3.fromRGB(255, 255, 255), TextSize = 12, Font = Enum.Font.GothamBold, RichText = true, TextXAlignment = Enum.TextXAlignment.Left, ZIndex = 7}),
		C("TextLabel", {Size = UDim2.new(1, -12, 0, 16), Position = UDim2.new(0, 6, 0, 24), BackgroundTransparency = 1, Text = v[3], TextColor3 = Color3.fromRGB(180, 190, 210), TextSize = 11, Font = Enum.Font.Gotham, TextXAlignment = Enum.TextXAlignment.Left, ZIndex = 7})
	})
end

local function An(i, t, p, f)
	local tw = T:Create(i, TweenInfo.new(t, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), p)
	if f then tw.Completed:Once(f) end tw:Play()
end

local busy = false
local function Toggle()
	if busy then return end busy, o = true, not o
	if o then
		m = false if not IP.Visible and not SP.Visible then Cnt.Visible = true end
		An(I, 0.2, {Size = UDim2.new(0, 0, 0, 0)}, function()
			I.Visible, M.Size, M.Visible = false, UDim2.new(0, 0, 0, 0), true
			An(M, 0.35, {Size = UDim2.new(0, w, 0, h), Position = UDim2.new(0.5, -375, 0.5, -240)}, function() busy = false end)
		end)
	else
		An(M, 0.25, {Size = UDim2.new(0, 0, 0, 0)}, function()
			M.Visible, I.Size, I.Visible = false, UDim2.new(0, 0, 0, 0), true
			An(I, 0.3, {Size = UDim2.new(0, 60, 0, 60)}, function() busy = false end)
		end)
	end
end

B.X.MouseButton1Click:Connect(Toggle)
B.M.MouseButton1Click:Connect(function()
	if busy or not o then return end busy, m = true, not m
	if m then Cnt.Visible, IP.Visible, SP.Visible = false, false, false else Cnt.Visible = not IP.Visible and not SP.Visible end
	An(M, 0.3, {Size = m and UDim2.new(0, w, 0, 50) or UDim2.new(0, w, 0, h)}, function() busy = false end)
end)

local function MakeDrag(trg, tar, clk)
	local d, sP, dP, mo
	trg.InputBegan:Connect(function(i)
		if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then
			if trg == B then
				local p = i.Position
				local function ib(btn) return p.X >= btn.AbsolutePosition.X and p.X <= btn.AbsolutePosition.X + btn.AbsoluteSize.X and p.Y >= btn.AbsolutePosition.Y and p.Y <= btn.AbsolutePosition.Y + btn.AbsoluteSize.Y end
				if ib(B.X) or ib(B.M) then return end
			end
			d, mo, sP, dP = true, false, i.Position, tar.Position
		end
	end)
	U.InputChanged:Connect(function(i)
		if d and (i.UserInputType == Enum.UserInputType.MouseMovement or i.UserInputType == Enum.UserInputType.Touch) then
			local delta = i.Position - sP
			if delta.Magnitude > 5 then mo, tar.Position = true, UDim2.new(dP.X.Scale, dP.X.Offset + delta.X, dP.Y.Scale, dP.Y.Offset + delta.Y) end
		end
	end)
	U.InputEnded:Connect(function(i) if d and (i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch) then d = false if clk and not mo then clk() end end end)
end

MakeDrag(I, I, Toggle)
MakeDrag(B, M)
