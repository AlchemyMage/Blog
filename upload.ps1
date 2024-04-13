cd _includes
./upload.bat
cd ../

cd _layouts
./upload.ps1
cd ../

cd assets
./upload.bat
cd ../

git config --local user.name "AlchemyMage"
git config --local user.email "alchemy@posetmage.com"
git remote set-url origin git@AM:AlchemyMage/Blog.git

git submodule update --recursive --remote

git pull
git add .
git commit -m "upload"
git push
