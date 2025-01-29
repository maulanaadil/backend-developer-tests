def compare_hashes(hash1, hash2, hash3)
  # Find the maximum width of each column
  key_width = (hash1.keys + hash2.keys + hash3.keys).map(&:length).max
  value_width = (hash1.values + hash2.values + hash3.values).map { |v| v.to_s.length }.max

  # Print the table header
  puts "+#{'-' * (key_width + 2)}+#{'-' * (value_width + 2)}+#{'-' * (value_width + 2)}+#{'-' * (value_width + 2)}+"
  puts "| #{'Key'.ljust(key_width)} | #{'You'.ljust(value_width)} | #{'Multi'.ljust(value_width)} | #{'Rand'.ljust(value_width)}|"
  puts "+#{'-' * (key_width + 2)}+#{'-' * (value_width + 2)}+#{'-' * (value_width + 2)}+#{'-' * (value_width + 2)}+"

  # Print the table rows
  hash1.each do |key, value|
    puts "| #{key.to_s.ljust(key_width)} | #{value.to_s.ljust(value_width)} | #{hash2[key].to_s.ljust(value_width)} | #{hash3[key].to_s.ljust(value_width)} |"
  end

  # Print the table footer
  puts "+#{'-' * (key_width + 2)}+#{'-' * (value_width + 2)}+#{'-' * (value_width + 2)}+#{'-' * (value_width + 2)}+"
end