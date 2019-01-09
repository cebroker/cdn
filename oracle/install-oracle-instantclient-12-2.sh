printf "Moving to home directory\n"
cd ~

printf "Installing script's dependencies\n"
sudo yum install wget unzip


printf "Downloading oracle 12.2\n"
wget -O instantclient-basic-linux.x64-12.2.0.1.0.zip https://github.com/cebroker/cdn/blob/master/oracle/oracle-driver/instantclient-basic-linux.x64-12.2.0.1.0.zip?raw=true

printf "Extracting the content of the zip file\n"
unzip instantclient-basic-linux.x64-12.2.0.1.0.zip

printf "Making symlinks from oracle libraries\n"
cd instantclient_12_2
ln -s libclntsh.so.12.1 libclntsh.so
ln -s libocci.so.12.1 libocci.so
cd ..

printf "Installing libaio dependency\n"
sudo yum install libaio


printf "Adding LD_LIBRARY_PATH to the PATH...\n"
echo "export LD_LIBRARY_PATH=~/instantclient_12_2:$:LD_LIBRARY_PATH" >> ~/.bashrc

printf "instantclient version 12.2 installed successfully\n\n"
