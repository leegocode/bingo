set -e
yarn run build
cd dist
git init
git add -A
git commit -m 'deploy'
git push -f git@github.com:leegocode/bingo.git master:gh-pages
cd -
#chmod +x deploy.sh
