#Things to be installed:
#    ffmpeg >= 2.6.2
#    pydub >= 0.11
#    pyaudio >= 0.2.7
#    numpy >= 1.8.2
#    scipy >= 0.13.3
#    matplotlib >= 1.3.1
#    mysqldb >= 1.2.3
#    opencv >= 2.4.8
#    django >= 1.6.1

# build for os x
# consult https://trac.ffmpeg.org/wiki/CompilationGuide/MacOSX
echo "Installing ffmpeg related dependencies"
brew install ffmpeg lame libvorbis theora speex
brew install yasm pkg-config faac openjpeg x264 libvpx

mkdir src && cd src
git clone http://source.ffmpeg.org/git/ffmpeg.git ffmpeg
cd ffmpeg

./configure --enable-gpl --enable-postproc --enable-swscale --enable-avfilter --enable-libmp3lame --enable-libvorbis --enable-libtheora --enable-libx264 --enable-libspeex --enable-shared --enable-pthreads --enable-libvpx --enable-libopenjpeg

make -j 2 && make install

# ldconfig

echo "Installing other dependencies"
brew install portaudio opencv nginx
pip install scipy numpy pyaudio matplotlib pydub gunicorn django MySQL-python
# ln -s /usr/local/mysql/lib/libmysqlclient.18.dylib /usr/lib/libmysqlclient.18.dylib

# pip freeze > requirements.txt
# pip install -r requirements.txt

echo "Installing dejavu"
git clone https://github.com/vasanthkalingeri/dejavu.git
cd dejavu
python setup.py install


mysqld

#When port audio has trouble installing run the following
#Download the .deb package of portaudio, the following is for amd64, change it to x86 if required.

#wget libportaudio-ocaml_0.2.0-1+b2_amd64.deb
#dpkg -i libportaudio-ocaml_0.2.0-1+b2_amd64.deb
##If dependency errors
#apt-get -f install
