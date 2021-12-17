local shakeHud = false;
local shakearrow = true;
local shakearrow2 = false;
local shakearrow3 = false;
local shakearrow4 = false;
local shakearrow5 = false;
local shakearrow6 = false;
local movearrow = false;
local hudXmove = false;
local hudXmovebigleft = false;
local hudXmovebigright = false;
local hudYmove = false;
local hudmoveForce = 12;
local camzoombeat = false;
local force = 2;

function start (song)
	print("Song: " .. song .. " @ " .. bpm .. " downscroll: " .. downscroll)
end


function update (elapsed)
	local currentBeat = (songPos / 1000)*(bpm/60)

    if curStep >= 1248 then
        cameraAngle = force * math.sin(currentBeat);
        camHudAngle = -force * math.sin(currentBeat);
    end

    if shakeHud == true then
        camHudAngle = force * math.sin(currentBeat);
    end

    if camzoombeat == true then
        setCamZoom(0.7);
        camzoombeat = false;
    end

    if hudXmove == true then
        hudX = hudmoveForce * math.sin(currentBeat)
    end

    if hudXmovebigleft == true then
        hudX = -hudmoveForce * math.sin(currentBeat) * math.pi
    end

    if hudXmovebigright == true then
        hudX = hudmoveForce * math.sin(currentBeat) * math.pi
    end

    if hudYmove == true then
        hudY = hudmoveForce * math.sin(currentBeat)
    end

    if shakearrow == true then
        for i=0,7 do
            setActorX(_G['defaultStrum'..i..'X'] + 0 * math.sin((currentBeat + i*0)), i)
            setActorY(_G['defaultStrum'..i..'Y'] + 10 * math.cos((currentBeat + i*0.25) * math.pi), i)
        end
    end
    if shakearrow2 == true then
        for i=0,7 do
            setActorX(_G['defaultStrum'..i..'X'] + 0 * math.sin((currentBeat + i*0)), i)
            setActorY(_G['defaultStrum'..i..'Y'] + 20 * math.cos((currentBeat + i*0.25) * math.pi), i)
        end
    end
    if shakearrow3 == true then
        for i=0,7 do
            setActorX(_G['defaultStrum'..i..'X'] + 32 * math.sin((currentBeat + i*0) * math.pi), i)
             setActorY(_G['defaultStrum'..i..'Y'] + 10 * math.cos((currentBeat + i*0.25) * math.pi), i)
         end
    end
    if shakearrow4 == true then
        for i=0,7 do
            setActorX(_G['defaultStrum'..i..'X'] + 0 * math.sin((currentBeat + i*0)), i)
            setActorY(_G['defaultStrum'..i..'Y'] + 5 * math.cos((currentBeat + i*0.25) * math.pi), i)
        end
    end
    if shakearrow5 == true then
        for i=0,7 do
            setActorX(_G['defaultStrum'..i..'X'] + 32 * math.sin((currentBeat + i*0) * math.pi), i)
            setActorY(_G['defaultStrum'..i..'Y'] + 20 * math.cos((currentBeat + i*0.25) * math.pi), i)
         end
    end
    if shakearrow6 == true then
        for i=0,7 do
            setActorX(_G['defaultStrum'..i..'X'] + 32 * math.sin((currentBeat + i*0.10) * math.pi), i)
            setActorY(_G['defaultStrum'..i..'Y'] + 20 * math.cos((currentBeat + i*1) * math.pi), i)
         end
    end
    if movearrow == true then
        for i=0,3 do
            setActorX(_G['defaultStrum'..i..'X'] + 300 * math.sin((currentBeat + i*0)) + 350, i)
            setActorY(_G['defaultStrum'..i..'Y'] + 15 * math.cos((currentBeat + i*0.25) * math.pi),i)
        end
        for i=4,7 do
            setActorX(_G['defaultStrum'..i..'X'] - 300 * math.sin((currentBeat + i*0)) - 275, i)
            setActorY(_G['defaultStrum'..i..'Y'] + 15 * math.sin((currentBeat + i*0.25) * math.pi), i)
        end
    end
end

function stepHit (step)
    if curStep == 120 or curStep == 248 or curStep == 375 or curStep == 632 or curStep == 696 or curStep == 824 or curStep == 952 or curStep == 1208 or curStep == 1310 or curStep == 1366 or curStep == 1496 or curStep == 1628 then
        for i=0,7 do
            tweenPosXAngle(i, _G['defaultStrum'..i..'X'],getActorAngle(i) + 360, 0.6, 'setDefault')
        end
    end
    if curStep == 257 then
        camzoombeat = true
        shakearrow = false;
        shakearrow2 = true;
    end
    if curStep == 385 then
        camzoombeat = true
        shakearrow2 = false;
        shakearrow = true;
    end
    if curStep == 513 then
        camzoombeat = true
        shakearrow = false;
        shakearrow3 = true;
        shakeHud = true;
    end
    if curStep == 642 then
        camzoombeat = true;
        shakeHud = false;
        shakearrow3 = false;
        camHudAngle = 0;
        shakearrow4 = true;
    end
    if curStep == 833 then
        camzoombeat = true;
        force = 4;
        shakeHud = true;
        shakearrow4 = false;
        shakearrow5 = true;
    end
    if curStep == 961 then
        camzoombeat = true;
        force = 2;
        shakearrow5 = false;
        shakearrow = true;
    end
    if curStep == 1088 then
        camzoombeat = true;
        shakeHud = false;
        camHudAngle = 0;
        hudYmove = true;
    end
    if curStep == 1217 then
        hudYmove = false;
        hudY = 0;
    end
    if curStep == 1377 then
        camzoombeat = true;
        shakearrow = false;
        shakearrow6 = true;
        hudXmove = true;
        hudmoveForce = 32;
    end
    if curStep == 1505 then
        camzoombeat = true;
        shakearrow6 = false;
        shakearrow3 = true;
    end
    if curStep == 1633 then
        camzoombeat = true;
        force = 4;
        shakearrow3 = false;
        hudXmove = false;
        hudXmovebigleft = true;
        movearrow = true;
    end
    if curStep == 1953 then
        camzoombeat = false;
        movearrow = false;
        hudYmove = true;
        hudXmovebigleft = false;
        hudXmovebigright = true;
        resetstaticarrows();
    end
    if curStep == 2081 then
        camzoombeat = true;
        shakearrow3 = true;
        force = 6;
        hudmoveForce = 45;
    end
    if curStep == 2337 then
        camzoombeat = true;
        force = 2;
        shakearrow3 = false;
        hudXmovebigright = false;
        hudYmove = false;
        hudX = 0;
        hudY = 0;
        resetstaticarrows();
    end
end

function resetstaticarrows()
    for i=0,7 do
        tweenPosXAngle(i, _G['defaultStrum'..i..'X'], 0, 0.6, 'setDefault')
        tweenPosYAngle(i, _G['defaultStrum'..i..'Y'], 0, 0.6, 'setDefault')
    end
end