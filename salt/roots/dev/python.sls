# Everything needed for Python code
virtualenvwrapper:
    pkg.installed

python-dev:
    pkg.installed

python3-dev:
    pkg.installed

get-pip2:
    cmd.run:
        - cwd: /usr/src
        - user: root
        - name: |
            curl "https://bootstrap.pypa.io/get-pip.py" -o "get-pip.py"
            python2 get-pip.py
        - unless: /usr/local/bin/pip2 --version
        - require:
            - pkg: curl

get-pip3:
    cmd.run:
        - cwd: /usr/src
        - user: root
        - name: |
            curl "https://bootstrap.pypa.io/get-pip.py" -o "get-pip.py"
            python3 get-pip.py
        - unless: /usr/local/bin/pip3 --version
        - require:
            - pkg: curl

# Numpy requirements
libatlas-base-dev:
    pkg.installed

gfortran:
    pkg.installed

libopenblas-dev:
    pkg.installed

{% for pkg in [
    "pyyaml",
    "jinja2",
    "progressbar2",
    "pyserial",
    "unittest2",
    "msgpack-python",
    "mock",
    "heapdict",
    "pykka",
    "matplotlib",
    "Pillow",
    "numpy",
    "scipy",
    "sklearn",
    "scikit-image",
    "theano",
    "lasagne",
    "scikit-neuralnetwork",
    "ipython",
    "nose",
    "pyinotify",
    "sniffer",
    "cairocffi",
    "sympy",
    "jupyter"
]%}
{{ pkg }}-python3:
    pip.installed:
        - name: {{ pkg }}
        - bin_env: /usr/local/bin/pip3
        - require:
            - cmd: get-pip3

{{ pkg }}-python2:
    pip.installed:
        - name: {{ pkg }}
        - bin_env: /usr/local/bin/pip2
        - require:
            - cmd: get-pip2
{% endfor %}


# Fabric is a python 2 only package
fabric:
    pip.installed:
        - name: Fabric
        - bin_env: /usr/local/bin/pip2
        - require:
            - cmd: get-pip2

unittest2:
    pip.installed:
        - bin_env: /usr/local/bin/pip3
        - require:
            - cmd: get-pip3

numpyson:
    pip.installed:
        - bin_env: /usr/local/bin/pip3
        - require:
            - cmd: get-pip3
