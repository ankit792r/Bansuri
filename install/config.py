from pathlib import Path
import shutil

from helper import run_as_root, install_packages

HOME = Path.home()
CONFIG_DIR = HOME / ".config"


def link_configs(source_dir="configs"):
    source_dir = Path(source_dir).resolve()
    CONFIG_DIR.mkdir(exist_ok=True)

    for item in source_dir.iterdir():
        target = CONFIG_DIR / item.name

        if target.exists() or target.is_symlink():
            if target.is_symlink() or target.is_file():
                target.unlink()
            elif target.is_dir():
                shutil.rmtree(target)

        print(f"Linking {item} → {target}")
        target.symlink_to(item)


def link_home_dotfiles(source_dir="defaults"):
    source_dir = Path(f"{source_dir}/rc").resolve()

    for item in source_dir.iterdir():
        target = HOME / f".{item.name}"

        if target.exists() or target.is_symlink():
            if target.is_symlink() or target.is_file():
                target.unlink()
            elif target.is_dir():
                shutil.rmtree(target)

        print(f"Linking {item} → {target}")
        target.symlink_to(item)

def link_niri_desktop(source_dir="defaults"):
    pass


def copy_sddm_theme(source_dir="defaults"):
    source_dir = Path(f"{source_dir}/sddm").resolve()
    themes_src = source_dir / "themes"
    themes_dst = Path("/usr/share/sddm/themes")

    print(f"Copying themes to {themes_dst}")
    for th in themes_src.iterdir():

        if th.exists() or th.is_symlink():
            if th.is_symlink() or th.is_file():
                th.unlink()
            elif th.is_dir():
                shutil.rmtree(th)

        run_as_root(f"cp -r {th} {themes_dst}")


def copy_sddm_config(source_dir="defaults"):
    source_dir = Path(f"{source_dir}/sddm").resolve()
    conf_src = source_dir / "sddm.conf"
    conf_dst = Path("/etc/sddm.conf")

    if conf_dst.exists() or conf_dst.is_symlink():
        if conf_dst.is_symlink() or conf_dst.is_file():
            conf_dst.unlink()
        elif conf_dst.is_dir():
            shutil.rmtree(conf_dst)

    print(f"Copying sddm.conf → {conf_dst}")
    run_as_root(f"cp -r {conf_src} {conf_dst}")


def configure_sddm(source_dir="defaults"):
    install_packages(["qt5-quickcontrols2", "qt5-graphicaleffects"])
    copy_sddm_theme(source_dir)
    copy_sddm_config(source_dir)
