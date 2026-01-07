from package import install_from_package_dir
from config import link_configs, link_home_dotfiles, configure_sddm
from theme import copy_icon_and_cursor_themes

if __name__ == "__main__":
    print("\n\tInstalling packages\n")
    install_from_package_dir()

    print("\n\tInstalling configs\n")
    link_configs()
    link_home_dotfiles()

    print("\n\tInstalling themes\n")
    copy_icon_and_cursor_themes()
   
    # print("\n\tConfiguring SDDM\n")
    # configure_sddm()
