mkdir -p jwtsecret

if [ ! -e "jwtsecret/jwt.hex" ]; then
  openssl rand -hex 32 | tr -d "\n" | tee > jwtsecret/jwt.hex
fi
