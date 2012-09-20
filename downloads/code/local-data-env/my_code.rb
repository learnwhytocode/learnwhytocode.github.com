if File.exists?(u)
  return open(u){|f| f.read}
else
  return nil
end
