----colors
--owner 	\169255000000 		red
--admin 	\169126252193		mint green
--smod 		\169017025255 		blue
--mod		\169130252255		cyan
--vip 		\169255255255		white

-- chat tags and colors
addhook("say","vsay")
function vsay(id,txt)
        for _, usgn in ipairs(ownerlist) do
                if player(id,'usgn') == usgn then
					msg("\169255000000"..player(id,"name").." <OWNER>: "..txt)
					return 1
				end
		end
        
        for _, usgn in ipairs(adminlist) do
                if player(id,'usgn') == usgn then
					msg('\169255000000'..player(id,'name')..' <ADMIN>: '..txt)
					return 1
				end
		end
		
        for _, usgn in ipairs(smodlist) do
                if player(id,'usgn') == usgn then
					msg("\169017025255"..player(id,"name").." <S-MOD>: "..txt)
					return 1
				end
		end
		
        for _, usgn in ipairs(modlist) do
                if player(id,'usgn') == usgn then
					msg("\169130252255"..player(id,"name").." <MOD>: "..txt)
					return 1
				end
		end
		
        for _, usgn in ipairs(viplist) do
                if player(id,'usgn') == usgn then
					msg("\169255255255"..player(id,"name").." <VIP>: "..txt)
					return 1
				end
		end
end

-- wallhack for admin and owner
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
								parse("setpos "..id.." "..x.." "..y)
							end
							
                        end
					
                end
			
        end
end

-- advertisement
addhook("minute","message.minute")
function message.minute()
        msg("\169048165110 Thanks for playing with vAdmin script!")
end
