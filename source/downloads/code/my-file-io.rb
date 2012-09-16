# convenience methods for file writing and reading
# (for beginners who aren't aware of blocks)

def my_file_reader(fname)
  fstream = File.open(fname, 'r')
  data = fstream.read
  fstream.close
  
  return data
end

def my_file_writer(fname, stuff)
  fstream = File.open(fname, 'w')
  fstream.write(stuff)
  fstream.close
end
