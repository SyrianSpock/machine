# Everything needed to write C/C++ code.

build-essential:
    pkg.installed

clang:
    pkg.installed

cmake:
    pkg.installed

autoconf:
    pkg.installed

automake:
    pkg.installed

exuberant-ctags:
    pkg.installed

libtool-bin:
    pkg.installed

git://github.com/cpputest/cpputest.git:
    git.latest:
        - rev: master
        - target: /usr/src/cpputest
        - user: root
        - require:
            - pkg: git

cpputest:
    cmd.run:
        - cwd: /usr/src/cpputest
        - user: root
        - name: |
            cd cpputest_build
            autoreconf .. -i
            ../configure
            make
            make install
        - creates: /usr/local/lib/libCppUTest.a

uncrustify:
    git.latest:
        - name: git://github.com/uncrustify/uncrustify
        - rev: master
        - target: /usr/src/uncrustify
        - user: root
        - require:
            - pkg: git

    cmd.run:
        - cwd: /usr/src/uncrustify
        - user: root
        - name: |
            mkdir -p build
            cd build
            cmake -DCMAKE_BUILD_TYPE=Release ..
            make
            make install
        - unless: which uncrustify
