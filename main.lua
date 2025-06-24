local game,state,bet,money={{},{}},"menu",0,10000
display.set_font("10x20")
local fontSize={10,20}
local cValue,cType={1,2,3,4,5,6,7,8,9,10,10,10,10,-1},{"C","H","S","D"}
function randomCard()
    local r = {cValue[math.random(1,14)],cType[math.random(1,4)]}
   for i=1,#game[1] do
       if game[1][i]==r then return randomCard() end
   end for i=1,#game[2] do
       if game[2][i]==r then return randomCard() end
end end
function calcPlayer(player)
    local l,v,a=0,0,0
    for i=1,#player do
        if player[i][1]==-1 then a=a+1
        else l=l+player[i][1] v=v+player[i][1] end
    end for i=1,a do
        l=l+1 v=v+1
        if v+9<=21 then v=v+9 end
    end return {l,v}
end

function gameStart()
  game={{},{}}
  return {{randomCard(),randomCard()},{randomCard(),randomCard()}}
end 

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
        elseif cState.left.just_pressed and money>=10 then bet=bet+10 money=money-10
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
        renderCentered("BLACKJACK",display.width/2,display.height/2-fontSize[2]*2)
        renderCentered("Press START",display.width/2, display.height/2+fontSize[2]*2)
    elseif state=="pickBet" then
        renderCentered("Money: "..tostring(money),display.width/2,display.height/2-fontSize[2]*2)
        renderCentered("Bet: "..tostring(bet),display.width/2,display.height/2+fontSize[2]*2)
    elseif state=="turnP1" or state=="turnP2" then
        
    end
end
