docker build -t my-bison-flex:latest .
mkdir workdir
cp calc.y calc.l run.sh workdir/
docker run -it -v "$PWD/workdir":/home/expl/workdir my-bison-flex:latest /bin/bash

