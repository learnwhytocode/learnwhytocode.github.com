require 'time'

cmembers.each do |cmember|
	seconds_from_creation = Time.now - Time.parse(cmember['created_at'])
	cmember['tweet_rate'] = cmember['statuses_count'].to_f / seconds_from_creation	
end

most_tweety_member = cmembers[0]

cmembers.each do |member|

	if member['tweet_rate'] > most_tweety_member['tweet_rate'] 
		most_tweety_member = member
	end
	
end
