function string:split(sep)
	local sep, fields = sep or ":", {}
	local pattern = string.format("([^%s]+)", sep)
	self:gsub(pattern, function(c) fields[#fields+1] = c end)
	return fields
end

function string:trim()
	return self:gsub("^%s*(.-)%s*$", "%1")
end

function dl_file(file_name, file_id)
	send = "https://api.telegram.org/bot"..bot_token.."/getFile?file_id="..file_id
	file = https.request(send)
	file = json.decode(file)
	send = "https://api.telegram.org/file/bot"..bot_token.."/"..file.result.file_path
	file = https.request(send)
	f = io.open(file_name, "w+")
	f:write(file)
	f:close()
	return true
end

function up_file(chat_id, file_name, caption)
	send = send_api.."/sendDocument"
	curl_command = "curl '"..send.."' -F 'chat_id="..chat_id.."' -F 'document=@"..file_name.."' -F 'caption="..(caption or " ").."'"
	return io.popen(curl_command)
end

function send_inline(chat_id, text, keyboard)
	local response = {}
	response.inline_keyboard = keyboard
	local responseString = json.encode(response)
	local sended = send_api.."/sendMessage?chat_id="..chat_id.."&text="..url.escape(text).."&parse_mode=Markdown&disable_web_page_preview=true&reply_markup="..url.escape(responseString)
	return send_req(sended)
end

function audio_voice(chat_id, file_id)
	send = "https://api.telegram.org/bot"..bot_token.."/getFile?file_id="..file_id
	file = https.request(send)
	file = json.decode(file)
	send = "https://api.telegram.org/file/bot"..bot_token.."/"..file.result.file_path
	file = https.request(send)
	f = io.open("voice.ogg", "w+")
	f:write(file)
	f:close()
	send = send_api.."/sendVoice"
	curl_command = "curl '"..send.."' -F 'chat_id="..chat_id.."' -F 'voice=@voice.ogg'"
	return io.popen(curl_command)
end

function voice_audio(chat_id, file_id, file_name, file_time, file_perform)
	send = "https://api.telegram.org/bot"..bot_token.."/getFile?file_id="..file_id
	file = https.request(send)
	file = json.decode(file)
	send = "https://api.telegram.org/file/bot"..bot_token.."/"..file.result.file_path
	file = https.request(send)
	f = io.open("audio.mp3", "w+")
	f:write(file)
	f:close()
	send = send_api.."/sendAudio"
	curl_command = "curl '"..send.."' -F 'chat_id="..chat_id.."' -F 'audio=@audio.mp3' -F 'title="..file_name..".mp3' -F 'performer="..file_perform.."' -F 'duration="..file_time.."'"
	return io.popen(curl_command)
end

function gif_video(chat_id, file_id, caption)
	send = "https://api.telegram.org/bot"..bot_token.."/getFile?file_id="..file_id
	file = https.request(send)
	file = json.decode(file)
	send = "https://api.telegram.org/file/bot"..bot_token.."/"..file.result.file_path
	file = https.request(send)
	f = io.open("video.avi", "w+")
	f:write(file)
	f:close()
	send = send_api.."/sendVideo"
	curl_command = "curl '"..send.."' -F 'chat_id="..chat_id.."' -F 'video=@video.avi' -F 'caption="..(caption or " ").."'"
	return io.popen(curl_command)
end

function video_gif(chat_id, file_id, caption)
	send = "https://api.telegram.org/bot"..bot_token.."/getFile?file_id="..file_id
	file = https.request(send)
	file = json.decode(file)
	send = "https://api.telegram.org/file/bot"..bot_token.."/"..file.result.file_path
	file = https.request(send)
	f = io.open("animate.gif", "w+")
	f:write(file)
	f:close()
	send = send_api.."/sendDocument"
	curl_command = "curl '"..send.."' -F 'chat_id="..chat_id.."' -F 'document=@animate.gif' -F 'caption="..(caption or " ").."'"
	return io.popen(curl_command)
end

function video_file(chat_id, file_id, caption)
	send = "https://api.telegram.org/bot"..bot_token.."/getFile?file_id="..file_id
	file = https.request(send)
	file = json.decode(file)
	send = "https://api.telegram.org/file/bot"..bot_token.."/"..file.result.file_path
	file = https.request(send)
	f = io.open("video.avi", "w+")
	f:write(file)
	f:close()
	send = send_api.."/sendDocument"
	curl_command = "curl '"..send.."' -F 'chat_id="..chat_id.."' -F 'document=@video.avi' -F 'caption="..(caption or " ").."'"
	return io.popen(curl_command)
end

function photo_sticker(chat_id, file_id)
	send = "https://api.telegram.org/bot"..bot_token.."/getFile?file_id="..file_id
	file = https.request(send)
	file = json.decode(file)
	send = "https://api.telegram.org/file/bot"..bot_token.."/"..file.result.file_path
	file = https.request(send)
	f = io.open("sticker.webp", "w+")
	f:write(file)
	f:close()
	send = send_api.."/sendSticker"
	curl_command = "curl '"..send.."' -F 'chat_id="..chat_id.."' -F 'sticker=@sticker.webp'"
	return io.popen(curl_command)
end

function photo_file(chat_id, file_id, caption)
	send = "https://api.telegram.org/bot"..bot_token.."/getFile?file_id="..file_id
	file = https.request(send)
	file = json.decode(file)
	send = "https://api.telegram.org/file/bot"..bot_token.."/"..file.result.file_path
	file = https.request(send)
	f = io.open("photo.png", "w+")
	f:write(file)
	f:close()
	send = send_api.."/sendDocument"
	curl_command = "curl '"..send.."' -F 'chat_id="..chat_id.."' -F 'document=@photo.png' -F 'caption="..(caption or " ").."'"
	return io.popen(curl_command)
end

function sticker_photo(chat_id, file_id, caption)
	send = "https://api.telegram.org/bot"..bot_token.."/getFile?file_id="..file_id
	file = https.request(send)
	file = json.decode(file)
	send = "https://api.telegram.org/file/bot"..bot_token.."/"..file.result.file_path
	file = https.request(send)
	f = io.open("photo.png", "w+")
	f:write(file)
	f:close()
	send = send_api.."/sendPhoto"
	curl_command = "curl '"..send.."' -F 'chat_id="..chat_id.."' -F 'photo=@photo.png' -F 'caption="..(caption or " ").."'"
	return io.popen(curl_command)
end

function sticker_file(chat_id, file_id, caption)
	send = "https://api.telegram.org/bot"..bot_token.."/getFile?file_id="..file_id
	file = https.request(send)
	file = json.decode(file)
	send = "https://api.telegram.org/file/bot"..bot_token.."/"..file.result.file_path
	file = https.request(send)
	f = io.open("photo.png", "w+")
	f:write(file)
	f:close()
	send = send_api.."/sendDocument"
	curl_command = "curl '"..send.."' -F 'chat_id="..chat_id.."' -F 'document=@photo.png' -F 'caption="..(caption or " ").."'"
	return io.popen(curl_command)
end

function send_file(chat_id, file_id, file_name, caption)
	send = "https://api.telegram.org/bot"..bot_token.."/getFile?file_id="..file_id
	file = https.request(send)
	file = json.decode(file)
	send = "https://api.telegram.org/file/bot"..bot_token.."/"..file.result.file_path
	file = https.request(send)
	f = io.open(file_name, "w+")
	f:write(file)
	f:close()
	send = send_api.."/sendDocument"
	curl_command = "curl '"..send.."' -F 'chat_id="..chat_id.."' -F 'document=@"..file_name.."' -F 'caption="..(caption or " ").."'"
	return io.popen(curl_command)
end

function send_photo(chat_id, file_id, caption)
	if caption then
		send = send_api.."/sendPhoto?chat_id="..chat_id.."&photo="..file_id.."&caption="..url.escape(caption)
	else
		send = send_api.."/sendPhoto?chat_id="..chat_id.."&photo="..file_id
	end
	return send_req(send)
end

function send_voice(chat_id, name)
	send = send_api.."/sendVoice"
	curl_command = 'curl -s "'..send..'" -F "chat_id='..chat_id..'" -F "voice=@'..name..'"'
	return io.popen(curl_command):read("*all")
end

function send_video(chat_id, file_name, caption)
	send = send_api.."/sendVideo"
	curl_command = "curl '"..send.."' -F 'chat_id="..chat_id.."' -F 'video=@"..file_name.."' -F 'caption="..(caption or " ").."'"
	return io.popen(curl_command):read("*all")
end

function send_pic(chat_id, file_name, caption)
	send = send_api.."/sendPhoto"
	curl_command = "curl '"..send.."' -F 'chat_id="..chat_id.."' -F 'photo=@"..file_name.."' -F 'caption="..(caption or " ").."'"
	return io.popen(curl_command):read("*all")
end

function send_st(chat_id, file_name)
	send = send_api.."/sendSticker"
	curl_command = "curl '"..send.."' -F 'chat_id="..chat_id.."' -F 'sticker=@"..file_name.."'"
	return io.popen(curl_command):read("*all")
end