# Prepare VM for tests
# This is run as root

rm -rf /srv/www_{blue,green} 2>/dev/null

mkdir /srv/www_{blue,green}
chown vagrant.vagrant /srv/www_{blue,green}

for i in blue green; do
  cd /srv/www_${i}
  git clone https://github.com/leucos/dummy-php-app.git
done

# Let's set blue older
cd /srv/www_blue/dummy-php-app
git checkout HEAD^

