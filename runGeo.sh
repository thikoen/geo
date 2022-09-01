#script for downloading latest release of geo app and running it as Docker container

#downloading image and injecting test data
#you might change postgres mount to your preferences
echo Downloading image...
sleep 1

docker run --name wp -d -p 3000:3000 -v /postgres_db:/var/lib/postgresql/data thkoenia/wahlprojekt:05
docker exec -d -it wp sh -c "npm run seed"

#starting the application
echo Starting Geo App.... Reach it under localhost:3000
sleep 5
docker exec -d -it wp sh-c "npm start"
