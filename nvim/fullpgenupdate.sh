# Use this script to update every plugin managed by pathogen in the bundle directory

cd ~/.vim/bundle
for i in `ls`; do
  cd "$i"
  echo "Pulling $i"
  git pull
  cd ..
done
