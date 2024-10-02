{ pkgs, ... }:
{
    # VS Code setup
    environment.systemPackages =
        with pkgs; [
            (vscode-with-extensions.override {
                vscode = vscodium;
                vscodeExtensions = with vscode-extensions; [
                    bbenoist.nix
                    arrterian.nix-env-selector
                    ms-python.python
                    ms-python.debugpy
                    ms-python.vscode-pylance
                    ms-python.pylint
                    yzhang.markdown-all-in-one
                    ms-azuretools.vscode-docker
                    ms-vscode-remote.remote-ssh
                    xaver.clang-format
                    llvm-vs-code-extensions.vscode-clangd
                    asvetliakov.vscode-neovim
                ];
            })
            python312Packages.python-lsp-server
        ];
    programs.neovim.enable = true;
}
