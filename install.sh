docker-compose build
docker-compose up -d
# setup first app
docker-compose exec php1 /bin/sh -c "composer install"
docker-compose exec php1 /bin/sh -c "npm install"
docker-compose exec php1 /bin/sh -c "npm run build"
docker-compose exec php1 /bin/sh -c "npm run dev"
docker-compose exec php1 php artisan config:cache
docker-compose exec php1 php artisan key:generate
docker-compose exec php1 php artisan migrate:fresh --seed
# setup second app
docker-compose exec php2 /bin/sh -c "composer install"
docker-compose exec php2 /bin/sh -c "npm install"
docker-compose exec php2 /bin/sh -c "npm run build"
docker-compose exec php2 /bin/sh -c "npm run dev"
docker-compose exec php2 php artisan config:cache
docker-compose exec php2 php artisan key:generate
docker-compose exec php2 php artisan migrate:fresh --seed