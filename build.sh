VERSION="0.0.1"

docker build -t jroberts235/armh-mosquitto:$VERSION . &&
docker push jroberts235/armh-mosquitto:$VERSION
