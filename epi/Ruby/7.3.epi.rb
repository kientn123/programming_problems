=begin
Compute all mnemonics for a phone number
=end
require 'set'
def compute(number_str, hash)
	mnemonics(number_str, 0, '', hash)
end	

def mnemonics(number_str, start, to_return, hash)
	if start == number_str.length
		puts to_return
	else
		hash[number_str[start]].each do |ele|
			mnemonics(number_str, start + 1, to_return + ele, hash)
		end
	end
end

hash = {
	'0' => Set.new(['0']),
	'1' => Set.new(['1']),
	'2' => Set.new(['A', 'B', 'C']),
	'3' => Set.new(['D', 'E', 'F']),
	'4' => Set.new(['G', 'H', 'I']),
	'5' => Set.new(['J', 'K', 'L']),
	'6' => Set.new(['M', 'N', 'O']),
	'7' => Set.new(['P', 'Q', 'R', 'S']),
	'8' => Set.new(['T', 'U', 'V']),
	'9' => Set.new(['W', 'X', 'Y', 'Z'])
}

well = '235'
compute(well, hash)