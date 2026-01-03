import subprocess
import os


def run(cmd):
    print(f"→ {cmd}")
    subprocess.run(cmd, shell=True, check=True)


def run_as_root(cmd: str):
    if os.geteuid() != 0:
        cmd = f"sudo {cmd}"
    print(f"→ {cmd}")
    subprocess.run(cmd, shell=True, check=True)


def install_packages(packages):
    if not packages:
        return
    pkg_str = " ".join(packages)
    run(f"sudo pacman -S --needed --noconfirm {pkg_str}")
