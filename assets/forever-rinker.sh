DIR="$(cd "$(dirname "$0")" && pwd)"
INTERVAL="${UPDATE_INTERVAL:-20}"

while true
do
	eval "$DIR/rinker.sh"
	sleep $INTERVAL
done