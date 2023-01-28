///from mind/transfer_to. Sent after the mind has been transferred: (mob/previous_body)
#define COMSIG_MIND_TRANSFERRED "mind_transferred"

/// Called on the mind when an antagonist is being gained, after the antagonist list has updated (datum/antagonist/antagonist)
#define COMSIG_ANTAGONIST_GAINED "antagonist_gained"

/// Called on the mind when an antagonist is being removed, after the antagonist list has updated (datum/antagonist/antagonist)
#define COMSIG_ANTAGONIST_REMOVED "antagonist_removed"

//F19 Edit

//Mood
#define COMSIG_ADD_MOOD_EVENT "add_mood" //Called when you send a mood event from anywhere in the code.
#define COMSIG_CLEAR_MOOD_EVENT "clear_mood" //Called when you clear a mood event from anywhere in the code.
#define COMSIG_MODIFY_SANITY "modify_sanity" //Called when you want to increase or decrease sanity from anywhere in the code.
