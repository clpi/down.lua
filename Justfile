all: slint llint clean

slint :
  stylua --check .

clean:
	fd --glob '*-E' -x rm

llint:
  luacheck .


version:
  echo "0.1.0"