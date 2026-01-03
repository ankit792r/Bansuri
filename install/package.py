from pathlib import Path
from helper import install_packages


def read_package_file(path):
    with open(path) as f:
        return [line.strip() for line in f if line.strip() and not line.startswith("#")]


def select_package_files(package_dir):
    files = sorted(Path(package_dir).glob("*.package"))

    # Always include system.package
    system_file = Path(package_dir) / "system.package"
    optional_files = [f for f in files if f != system_file]

    print("Optional package groups:\n")
    for i, f in enumerate(optional_files, 1):
        print(f"{i}. {f.stem}")

    choice = input(
        "\nSelect packages to install (e.g. 1 3 4 or press Enter to skip): "
    ).strip()

    selected = []

    if choice:
        indexes = {int(i) for i in choice.split() if i.isdigit()}
        for i, f in enumerate(optional_files, 1):
            if i in indexes:
                selected.append(f)

    return system_file, selected


def install_from_package_dir(package_dir="packages"):
    system_file, selected_files = select_package_files(package_dir)

    # Always install system packages
    print("\nInstalling system packages...")
    install_packages(read_package_file(system_file))

    # Install optional packages
    for f in selected_files:
        print(f"\nInstalling {f.stem} packages...")
        install_packages(read_package_file(f))
