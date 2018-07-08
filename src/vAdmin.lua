
ownerColor = 		"\169255000000"		--red
adminColor = 		"\169126252193"		--mint green
smodColor = 		"\169017025255"		--blue
modColor = 		"\169130252255"		--cyan
vipColor =			"\169255255255"		--white

tagColor = 		"\169255255255"
ctColor =			"\169050150255"
tColor = 			"\169255025000"

adColor = 			"\169048165110"

dofile("sys/lua/wrapper.lua")

function vmsg(id, team, txt, rank, rankColor)
	if team == 2 then
		msg(ctColor..player(id,"name")..tagColor.." <"..rank..">: "..rankColor..txt)
	elseif team == 1 then
		msg(tColor..player(id,"name")..tagColor.." <"..rank..">: "..rankColor..txt)
	else
		msg(player(id,"name")..tagColor.." <"..rank..">: "..rankColor..txt)
	end
end	

addhook("say","vsay")
function vsay(id,txt)
        for _, usgn in ipairs(ownerlist) do
                if player(id, "usgn") == usgn then
					vmsg(id, player(id, "team"), txt, "Owner", ownerColor)
					return 1
				end
		end
        
        for _, usgn in ipairs(adminlist) do
                if player(id, "usgn") == usgn then
					vmsg(id, player(id, "team"), txt, "Admin", adminColor)
					return 1
				end
		end
		
        for _, usgn in ipairs(smodlist) do
                if player(id, "usgn") == usgn then
					vmsg(id, player(id, "team"), txt, "S-Mod", smodColor)
					return 1
				end
		end
		
        for _, usgn in ipairs(modlist) do
                if player(id, "usgn") == usgn then
					vmsg(id, player(id, "team"), txt, "Mod", modColor)
					return 1
				end
		end
		
        for _, usgn in ipairs(viplist) do
                if player(id, "usgn") == usgn then
					vmsg(id, player(id, "team"), txt, "VIP", vipColor)
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
		setpos(id,x,y)
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
        msg(adColor.." Thanks for playing with vAdmin script!")
end
