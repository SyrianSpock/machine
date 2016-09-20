gpu-driver-repo:
    # Package repository
    pkgrepo.managed:
        - ppa: graphics-drivers/ppa

{% for pkg in [
    "nvidia-367",
    "nvidia-367-dev",
    "nvidia-modprobe",
    "nvidia-prime",
    "nvidia-profiler",
    "nvidia-settings",
    "nvidia-visual-profiler"
]%}
{{ pkg }}:
    pkg.installed:
        - require:
            - pkgrepo: gpu-driver-repo
{% endfor %}
