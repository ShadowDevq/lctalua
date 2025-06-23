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
        if cState.a.just_released and money>=5 then bet=bet+5 money=money-5
        elseif cState.b.just_released and money>=10 then bet=bet+10 money=money-10
        elseif cState.c.just_released and money>=50 then bet=bet+50 money=money-50
        elseif cState.d.just_released and money>=100 then bet=bet+100 money=money-100 end
    elseif state=="turnP1" then

    elseif state=="turnP2" then

end end

function lilka.draw()
    display.fill_screen(display.color565(0,125,20))
    if state=="menu" then
        display.set_cursor(display.width/2-math.floor(fontSize[1]*4.5), display.height/2-fontSize[2]*2)
        display.print("BLACKJACK")
        display.set_cursor(display.width/2-math.floor(fontSize[1]*5.5), display.height/2+fontSize[2]*2)
        display.print("Press START")
    elseif state=="pickBet" then
        
    elseif state=="turnP1" or state=="turnP2" then
        
    end
end
