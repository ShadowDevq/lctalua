local cValue,cType={1,2,3,4,5,6,7,8,9,10,10,10,10,-1},{"C","H","S","D"}
function randomCard()
  return {cValue[math.random(1,14)],cType[math.random(1,4)]}
end

function gameStart()
  return {{randomCard(),randomCard()},{randomCard(),randomCard()}}
end 
local game,state,bet,money={},"menu",0,10000
display.set_font("10x20")
local fontSize={10,20}

function lilka.update(delta)
    local cState=controller.get_state()
    if cState.select.just_pressed then util.exit() end
    if state=="menu" then
        if cState.start.just_released then 
          game=gameStart()
          bet=0
          state="pickBet"
        end
    elseif state=="pickBet" then
        if cState.down.just_pressed and money>=5 then bet=bet+5 money=money-5
        elseif cState.back.just_pressed and money>=10 then bet=bet+10 money=money-10
        elseif cState.right.just_pressed and money>=50 then bet=bet+50 money=money-50
        elseif cState.up.just_pressed and money>=100 then bet=bet+100 money=money-100
        elseif cState.a.just_pressed then money=money+bet bet=0
        elseif cState.start.just_released then state="turnP1" end
    elseif state=="turnP1" then

    elseif state=="turnP2" then

end end

function renderCentered(text,x,y)
    display.set_cursor(x-math.floor(fontSize[1]*#text/2),y)
    display.print(text)
end

function lilka.draw()
    display.fill_screen(display.color565(0,125,20))
    if state=="menu" then
        renderCentered("BLACKJACK",display.width/2,display.height-fontSize[2]*2)
        renderCentered("Press START",display.width/2, display.height/2+fontSize[2]*2)
    elseif state=="pickBet" then
        renderCentered("Money: "..to string(money),display.width/2,display.height/2-fontSize[2]*2)
        renderCentered("Bet: "..to string(bet),display.width/2,display.height/2+fontSize[2]*2)
    elseif state=="turnP1" or state=="turnP2" then
        
    end
end
