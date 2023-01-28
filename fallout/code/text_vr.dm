/proc/log_mentor(text)
	GLOB.mentorlog.Add(text)
	WRITE_FILE(GLOB.world_game_log, "\[[TIME_STAMP("hh:mm:ss", FALSE)]]MENTOR: [text]")
