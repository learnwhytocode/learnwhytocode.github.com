load './my-first-methods.rb'

url_pattern = "http://TK_DATA_ROOT_PATH/statuses/_USER_NAME/_PAGENUM_/user_timeline.json"
screen_name = "joebiden"

(1..3).each do |page_num|
	url = url_pattern.sub("_USER_NAME_", screen_name).sub("_PAGENUM_", page_num.to_s)
	download_and_save(url_1)
end
