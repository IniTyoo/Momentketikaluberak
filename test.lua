res = {}
res.fileExist = function(file)  local f = io.open(file, "rb")  if f then f:close() end  return f ~= nil end
res.readFile = function(filename) file = io.open(filename, "r") io.input(file) bang = io.read() io.close(file) return bang end
res.writeFile = function(filename, data) file = io.open(filename, "w") io.output(file) io.write(data) io.close(file) end
res.appendFile = function(filename, data) file = io.open(filename, "a") io.output(file) io.write(data) io.close(file) end
return res
