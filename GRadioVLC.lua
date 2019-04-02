--[[
	Greek Radio Streaming with VLC  
	Authors: Christos Alexiou (http://christosalexiou.tk) 
-- ]] 

stationList = {
		{ name = "Sohos FM: 88.7", link = "https://www.internet-radio.com/servers/tools/playlistgenerator/?u=http://37.187.57.33:8078/listen.pls?sid=1&t=.pls" },
		{ name = "Radio Pieria" , link = "https://www.internet-radio.com/servers/tools/playlistgenerator/?u=http://s6.onweb.gr:8018/listen.pls&t=.pls" }, 
		{ name = "Radio Phlio" , link = "https://www.internet-radio.com/servers/tools/playlistgenerator/?u=http://37.59.37.6:10534/listen.pls?sid=1&t=.pls" }, 
		{ name = "Alfa 103 FM Volos" , link = "https://www.internet-radio.com/servers/tools/playlistgenerator/?u=http://88.198.10.229:9098/listen.pls?sid=1&t=.pls" },
		{ name = "GR Ellinikos" , link = "https://www.internet-radio.com/servers/tools/playlistgenerator/?u=http://37.187.57.33:8084/listen.pls?sid=1&t=.pls" }, 
		{ name = "Stoxos FM 99" , link = "https://www.internet-radio.com/servers/tools/playlistgenerator/?u=http://s3.onweb.gr:8016/listen.pls&t=.pls" }, 
		{ name = "Live FM 89.6" , link = "https://www.internet-radio.com/servers/tools/playlistgenerator/?u=http://s3.onweb.gr:8016/listen.pls&t=.pls" }, 
		{ name = "Fasma FM 99.7" , link = "https://www.internet-radio.com/servers/tools/playlistgenerator/?u=http://eco.onestreaming.com:8033/listen.pls?sid=1&t=.pls" }, 
		{ name = "Ntefi Radio" , link = "https://www.internet-radio.com/servers/tools/playlistgenerator/?u=http://54.38.92.135:8102/listen.pls?sid=1&t=.pls" }, 
	}
	
	
function descript() 
		return { title = "Greek Radio Streaming" ;
					version = "0.1" ; 
					author = "Christos Alexiou" 
					functions = {} } 
						 
end 
	
function activ() 
		dialog = vlc.dialog("Greek Radio Streaming")  
		list = dialog:add_list(1,3,4,1) 
		button_play = dialog:add_button("Play", click_play, 1, 4, 4, 1) 
		-- the radio stations 
		for idx, details in ipairs(stationList) do 
				list:add_value(details.name, idx) 
		end 
			
		dialog:show() 
end 

function click_play() 
		selection = list.get_selection() 
		if (not selection) then return 1 end 
		local sel = nil 
		for idx, selectedItem in pairs(selection) dp 
			sel = idx 
			break 
		end 
		details = stationList[sel] 
		
		-- playing the selected radio station 
		vlc.playlist.clear() 
		vlc.playlist.add() 
		vlc.playlist.play() 
end 

function quit() 
end 

function abort() 
			vlc.deactivate() 
end 


