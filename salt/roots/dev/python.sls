# Everything needed for Python code
virtualenvwrapper:
  pkg.installed

python-dev:
    pkg.installed

python3-dev:
    pkg.installed

python-pip:
    pkg.installed

python3-pip:
    pkg.installed

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
    "numpy",
]%}
{{ pkg }}-python3:
    pip.installed:
        - name: {{ pkg }}
        - bin_env: /usr/bin/pip3
        - require:
            - pkg: python3-pip

{{ pkg }}-python2:
    pip.installed:
        - name: {{ pkg }}
        - bin_env: /usr/bin/pip2
        - require:
            - pkg: python-pip
{% endfor %}


# Fabric is a python 2 only package
fabric:
    pip.installed:
        - bin_env: /usr/bin/pip2
        - require:
            - pkg: python-pip
