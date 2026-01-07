from pathlib import Path
import shutil

from helper import run_as_root, install_packages

def copy_icon_and_cursor_themes(source_dir="defaults"):
    source_dir = Path(source_dir).resolve()
    icons_src = source_dir / "icons"
    cursors_src = source_dir / "cursors"

    icons_dst = Path("/usr/share/icons")

    print(f"Installing icon themes → {icons_dst}")
    _copy_theme_dir(icons_src, icons_dst)

    print(f"Installing cursor themes → {icons_dst}")
    _copy_theme_dir(cursors_src, icons_dst)


def _copy_theme_dir(src: Path, dst: Path):
    if not src.exists():
        print(f"Skipping {src}, does not exist")
        return

    for theme in src.iterdir():
        target = dst / theme.name

        if target.exists() or target.is_symlink():
            if target.is_symlink() or target.is_file():
                run_as_root(f"rm -f {target}")
            elif target.is_dir():
                run_as_root(f"rm -rf {target}")

        run_as_root(f"cp -r {theme} {dst}")

