set -e

rm -f v2g g2v

if ! [[ -p v2g ]]; then
  mkfifo v2g
fi

if ! [[ -p g2v ]]; then
  mkfifo g2v
fi


echo "SETUP COMPLETE"

exit 0
