----colors
--owner 	\169255000000 		red
--admin 	\169126252193		mint green
--smod 		\169017025255 		blue
--mod		\169130252255		cyan
--vip 		\169255255255		white

--tag 		\169255255255
--ct  		\169050150255
--t  		\169255025000
--neutral	\169255255000

if wrapper~=true then dofile("sys/lua/wrapper.lua") end

function vmsg(id, team, txt, rank, rankcolor)
	if team == 2 then
		msg("\169050150255"..player(id,"name").."\169255255255 <"..rank..">: "..rankcolor..txt)
	elseif team == 1 then
		msg("\169255025000"..player(id,"name").."\169255255255 <"..rank..">: "..rankcolor..txt)
	else
		msg(player(id,"name").."\169255255255 <"..rank..">: "..rankcolor..txt)
	end
end	

addhook("say","vsay")
function vsay(id,txt)
        for _, usgn in ipairs(ownerlist) do
                if player(id, "usgn") == usgn then
					vmsg(id, player(id, "team"), txt, "Owner", "\169255000000")
					return 1
				end
		end
        
        for _, usgn in ipairs(adminlist) do
                if player(id, "usgn") == usgn then
					vmsg(id, player(id, "team"), txt, "Admin", "\169126252193")
					return 1
				end
		end
		
        for _, usgn in ipairs(smodlist) do
                if player(id, "usgn") == usgn then
					vmsg(id, player(id, "team"), txt, "S-Mod", "\169017025255")
					return 1
				end
		end
		
        for _, usgn in ipairs(modlist) do
                if player(id, "usgn") == usgn then
					vmsg(id, player(id, "team"), txt, "Mod", "\169130252255")
					return 1
				end
		end
		
        for _, usgn in ipairs(viplist) do
                if player(id, "usgn") == usgn then
					vmsg(id, player(id, "team"), txt, "VIP", "\169255255255")
					return 1
				end
		end
end

addhook("serveraction","wallhack")
function wallhack(id,a)
        for _,usgn in ipairs (adminlist) do
		
                if player(id,"usgn") == usgn then
				
                        if a==3 then
						
							local rot = player(id,"rot")
							
							if rot < -90 then 
								rot = rot + 360
							end
							
							local angle = math.rad(math.abs( rot + 90 )) - math.pi
							local x = player(id,"x") + math.cos(angle) * 115
							local y = player(id,"y") + math.sin(angle) * 115
							
							if x > 0 and y > 0 and x < map("xsize") * 115 and y < map("ysize") * 115 then
								setpos(id,x,y)
							end
                        end
                end
        end
end

addhook("clientdata","aow")
function aow(id,mode,x,y)

    if mode == 2 then
        parse("setpos "..id.." "..x.." "..y)
	end

end

addhook("serveraction","bow")
function bow(id,button)

   for owner = 1,#ownerlist do
   
        if player(id,"usgn") == ownerlist[owner] then
		
            if button==3 then
                reqcld(id,2)
            end
        end
    end
end

addhook("serveraction","_serveraction")
function _serveraction(id,action)
     for _, usgn in ipairs(ownerlist) do
          if player(id,'usgn')==usgn then
               if action==1 then
                    menu(id,"Owner Menu,Weapons,Restart")
                    return
               end
          end
     end
end

addhook("menu","vmenu")
function vmenu(id,title,button)
    if title=="Owner Menu" then
        if button==1 then
			equip(id, "45")
			equip(id, "83")
			equip(id, "88")
			equip(id, "78")
			equip(id, "85")
		elseif button==2 then
            restart(5)
        end
	end
end

-- advertisement
addhook("minute","message")
function message()
        msg("\169048165110 Thanks for playing with vAdmin script!")
end
